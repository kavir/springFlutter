import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fetchTransactionHistory.dart';

class TransactionHistoryPage extends ConsumerStatefulWidget {
  final int? userId;
  final double amount;
  const TransactionHistoryPage(
      {super.key, required this.userId, required this.amount});

  @override
  ConsumerState<TransactionHistoryPage> createState() =>
      _TransactionHistoryPageState();
}

class _TransactionHistoryPageState
    extends ConsumerState<TransactionHistoryPage> {
  bool _isBalanceVisible = false;
  String selectedFilter = "7D";
  DateTimeRange? selectedDateRange;

  @override
  void initState() {
    super.initState();
    fetchTransactions();
  }

  void fetchTransactions() {
    setState(() {});
    ref.read(transactionProvider.notifier).transaction(
        widget.userId,
        selectedFilter,
        selectedDateRange?.start.toString(),
        selectedDateRange?.end.toString());
  }

  void onTabChanged(String? newValue) {
    if (newValue != null) {
      setState(() {
        selectedDateRange = null;
        selectedFilter = newValue;
        fetchTransactions();
      });
    }
  }

  Future<void> selectDateRange(BuildContext context) async {
    final pickedRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (pickedRange != null) {
      setState(() {
        selectedDateRange = pickedRange;
        selectedFilter =
            "${pickedRange.start.toString()}-${pickedRange.end.toString()}";
        fetchTransactions();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactionsState = ref.watch(transactionProvider);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Transaction History",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFFB04E6D),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                    bottom: BorderSide(color: Colors.white.withOpacity(0.3))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        _isBalanceVisible
                            ? 'NPR ${widget.amount}'
                            : 'NPR XXXX.XX',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _isBalanceVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {
                          setState(() {
                            _isBalanceVisible = !_isBalanceVisible;
                          });
                        },
                      ),
                    ],
                  ),
                  TabBar(
                    onTap: (index) {
                      switch (index) {
                        case 0:
                          onTabChanged("7D");
                          break;
                        case 1:
                          onTabChanged("14D");
                          break;
                        case 2:
                          onTabChanged("30D");
                          break;
                        case 3:
                          selectDateRange(context);
                          break;
                      }
                    },
                    tabs: [
                      Tab(text: "7 Days"),
                      Tab(text: "14 Days"),
                      Tab(text: "30 Days"),
                      Tab(text: "Custom"),
                    ],
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white.withOpacity(0.6),
                    indicatorColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: transactionsState.maybeWhen(
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                  loading: (loading) =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err) => Center(
                      child: Text("Error: $err",
                          style: TextStyle(color: Colors.white))),
                  success: (transactions) {
                    if (transactions == null || transactions.isEmpty) {
                      return const Center(
                          child: Text("No transactions found.",
                              style: TextStyle(color: Colors.white)));
                    }

                    transactions.sort((a, b) => DateTime.parse(b.timestamp)
                        .compareTo(DateTime.parse(a.timestamp)));

                    return ListView.builder(
                      itemCount: transactions.length,
                      itemBuilder: (context, index) {
                        final transaction = transactions[index];
                        bool isSender = transaction.transactionRole == 'Sent';
                        return Card(
                          color: const Color.fromARGB(255, 66, 66, 66),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            title: Text(
                              transaction.receiverName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Number: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.white.withOpacity(0.6)),
                                      ),
                                      Text(
                                        transaction.phoneNumber,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.white.withOpacity(0.6)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Amount: ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color:
                                                Colors.white.withOpacity(0.6)),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            isSender
                                                ? Icons.arrow_drop_down
                                                : Icons.arrow_drop_up,
                                            color: isSender
                                                ? const Color.fromRGBO(
                                                    244, 67, 54, 1)
                                                : const Color.fromRGBO(
                                                    76, 175, 80, 1),
                                            size: 18,
                                          ),
                                          Text(
                                            "${transaction.amount}",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: isSender
                                                    ? Colors.red
                                                    : Colors.green),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Time: ${formatTimestamp(transaction.timestamp)}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                ],
                              ),
                            ),
                            trailing: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 4),
                              decoration: BoxDecoration(
                                color: transaction.status == "SUCCESS"
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                transaction.status,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  String formatTimestamp(String timestampString) {
    DateTime timestamp = DateTime.parse(timestampString);
    return "${timestamp.hour}:${timestamp.minute < 10 ? '0' : ''}${timestamp.minute} - ${timestamp.day}/${timestamp.month}/${timestamp.year}";
  }
}
