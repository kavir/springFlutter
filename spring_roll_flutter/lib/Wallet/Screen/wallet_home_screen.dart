import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Utils/toast_utils.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fund_transfer_provider.dart';
import 'package:spring_roll_flutter/Wallet/Provider/indv_user_dashBoard_info_provider.dart';
import 'package:spring_roll_flutter/Wallet/Provider/web_socket_provider.dart';
import 'package:spring_roll_flutter/Wallet/Screen/ElectricityScreen.dart';
import 'package:spring_roll_flutter/Wallet/Screen/fun_transfer_screen.dart';
import 'package:spring_roll_flutter/Wallet/Screen/qr_screen.dart';
import 'package:spring_roll_flutter/Wallet/Screen/transaction_history_screen.dart';

class WalletHomePage extends ConsumerStatefulWidget {
  WalletHomePage({
    Key? key,
  });

  @override
  ConsumerState<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends ConsumerState<WalletHomePage> {
  late WebSocketService _webSocketService;
  bool _isBalanceVisible = false;
  int id = 0;
  String name = '';
  String number = '';
  double amount = 0.0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(indvDahsboardInfoProvider.notifier).indvInfoProvider();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(fundTransferProvider, (previous, next) {
      next.maybeMap(
        orElse: () {},
        loading: (value) {},
        success: (value) async {
          ref.read(indvDahsboardInfoProvider.notifier).indvInfoProvider();
        },
        loginError: (value) {
          ToastUtils().showErrorToast(context, value.errorMessage ?? "");
        },
        error: (value) {
          ToastUtils().showErrorToast(context, "Login Failure");
        },
      );
    });
    ref.watch(indvDahsboardInfoProvider).maybeWhen(
        success: (useryDetails) {
          id = useryDetails!.userId;
          name = useryDetails.userName;
          number = useryDetails.userPhoneNumber;
          amount = useryDetails.walletBalance;
          print("the user ko number is ___$number");
        },
        orElse: () => 'No Logo');
    _webSocketService = WebSocketService(id.toString());

    // Listen to balance updates
    _webSocketService.balanceStream.listen((message) {
      final updatedBalance = jsonDecode(message);
      setState(() {
        amount = updatedBalance;
      });
    });
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: Color(0xFFB04E6D),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Color(0xFFB04E6D),
              child: Icon(Icons.account_circle, size: 35, color: Colors.white),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, $name",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  number,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBalanceSection(),
              SizedBox(height: 15),
              _buildWalletOptions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceSection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 66, 66, 66), // Black background
        borderRadius: BorderRadius.circular(12), // More rounded edges
      ),
      padding: EdgeInsets.symmetric(
          vertical: 8, horizontal: 12), // Padding for spacing
      child: Column(
        mainAxisSize: MainAxisSize.min, // Reduce space inside the column
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                _isBalanceVisible ? 'NPR $amount' : 'NPR XXXX.XX',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for contrast
                ),
              ),
              IconButton(
                icon: Icon(
                  _isBalanceVisible ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                  size: 18, // Reduce icon size for better alignment
                ),
                onPressed: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
              ),
            ],
          ),
          Text(
            'Balance',
            style: TextStyle(
                fontSize: 14, color: Colors.white), // White text for contrast
          ),
        ],
      ),
    );
  }

  Widget _buildWalletOptions() {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 66, 66, 66), // Black background
        borderRadius: BorderRadius.circular(12), // Rounded edges
      ),
      padding: EdgeInsets.all(4),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 4,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 1.1,
        children: [
          _buildOptionCard(
            Icons.account_balance_wallet,
            'History',
            () {},
          ),
          _buildOptionCard(
            Icons.credit_card,
            'Add Money',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QRCodePage(
                          userPhoneNumber: number,
                        )),
              );
            },
          ),
          _buildOptionCard(
            Icons.history,
            'Transactions',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionHistoryPage(
                          userId: id ?? 0,
                          amount: amount,
                        )),
              );
            },
          ),
          _buildOptionCard(
            Icons.send_and_archive,
            'Send Money',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransferForm()),
              );
            },
          ),
          _buildOptionCard(
            Icons.send_and_archive,
            'Electricity Bill',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ElectricityBillScreen(userId: id,)),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: Colors.white), // Smaller icon
          SizedBox(height: 3), // Reduced spacing
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 10), // Smaller text
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
