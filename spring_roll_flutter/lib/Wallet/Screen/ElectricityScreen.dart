import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fetch_electricity_bill_provider.dart';
import 'package:spring_roll_flutter/Wallet/Provider/payNEABillProvider.dart';

class ElectricityBillScreen extends ConsumerStatefulWidget {
  final int userId;
  final String number;

  const ElectricityBillScreen(
      {super.key, required this.userId, required this.number});

  @override
  ConsumerState<ElectricityBillScreen> createState() =>
      _ElectricityBillScreenState();
}

class _ElectricityBillScreenState extends ConsumerState<ElectricityBillScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(electricityBillProvider.notifier).getBills(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final electricityBillState = ref.watch(electricityBillProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Electricity Bills',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFB04E6D),
      ),
      body: electricityBillState.maybeWhen(
        orElse: () => const Center(child: Text('Loading...')),
        loading: (isLoading) =>
            const Center(child: CircularProgressIndicator()),
        error: (error) => Center(child: Text('Error: $error')),
        success: (bills) {
          if (bills == null || bills.isEmpty) {
            return const Center(child: Text('No bills found.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: bills.length,
            itemBuilder: (context, index) {
              final bill = bills[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: const Color.fromARGB(255, 66, 66, 66),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bill ID: ${bill.id}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      const SizedBox(height: 8),
                      Text(
                        'Amount: ${bill.amount} NPR',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Units Consumed: ${bill.unitsConsumed}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Due Date: ${DateTime.parse(bill.billDate).toLocal()}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status: ${bill.paid ? "Paid" : "Pending"}',
                            style: TextStyle(
                              color: bill.paid ? Colors.green : Colors.orange,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (!bill.paid)
                            ElevatedButton(
                              onPressed: () {
                                final TextEditingController mpinController =
                                    TextEditingController();

                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Enter MPIN'),
                                      content: TextField(
                                        controller: mpinController,
                                        keyboardType: TextInputType.number,
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          labelText: 'MPIN',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            final String mpin =
                                                mpinController.text;
                                            if (mpin.isNotEmpty) {
                                              ref
                                                  .read(payNEABillProvider
                                                      .notifier)
                                                  .payNEA(widget.number,
                                                      bill.id, mpin);
                                            }
                                            Navigator.of(context)
                                                .pop(); // Close the dialog
                                          },
                                          child: const Text('Pay Now'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Pay Now'),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
