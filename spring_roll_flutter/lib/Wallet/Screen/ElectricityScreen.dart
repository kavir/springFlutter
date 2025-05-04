// electricity_bill_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fetch_electricity_bill_provider.dart';
// Import your model

class ElectricityBillScreen extends ConsumerStatefulWidget {
  final int userId;
  const ElectricityBillScreen({super.key, required this.userId});

  @override
  ConsumerState<ElectricityBillScreen> createState() =>
      _ElectricityBillScreenState();
}

class _ElectricityBillScreenState extends ConsumerState<ElectricityBillScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(electricityBillProvider.notifier).getBills(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final electricityBillState = ref.watch(electricityBillProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electricity Bills'),
      ),
      body: electricityBillState.maybeWhen(
        orElse: () => const Center(child: Text('Loading...')),
        success: (bills) {
          print("the bills are here $bills");
          if (bills!.isEmpty) {
            return const Center(child: Text('No bills found.'));
          }
          return ListView.builder(
            itemCount: bills.length,
            itemBuilder: (context, index) {
              final bill = bills[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text('Bill ID: ${bill.id}'),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Amount: ${bill.amount} NPR'),
                        Text('Units Consumed: ${bill.unitsConsumed}'),
                        Text(
                            'Due Date: ${DateTime.parse(bill.billDate).toLocal()}'),
                        Text(
                            'Status: ${(bill.paid == true) ? "Paid" : "Pending"}'),
                      ],
                    ),
                  ),
                  trailing: Icon(
                    (bill.paid == true) ? Icons.check_circle : Icons.warning,
                    color: (bill.paid == true) ? Colors.green : Colors.orange,
                  ),
                  onTap: () {
                    // Handle bill tap, maybe navigate to a bill details page
                  },
                ),
              );
            },
          );
        },
        loading: (loading) => const Center(child: CircularProgressIndicator()),
        error: (error) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Paid':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Overdue':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
