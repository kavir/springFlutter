import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Utils/constants/colors.dart';
import 'package:spring_roll_flutter/Utils/toast_utils.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fetchRewardPoints.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fund_transfer_provider.dart';
import 'package:spring_roll_flutter/Wallet/Provider/indv_user_dashBoard_info_provider.dart';
import 'package:spring_roll_flutter/Wallet/Provider/web_socket_provider.dart';
import 'package:spring_roll_flutter/Wallet/Screen/ElectricityScreen.dart';
import 'package:spring_roll_flutter/Wallet/Screen/editUserProfile.dart';
import 'package:spring_roll_flutter/Wallet/Screen/fun_transfer_screen.dart';
import 'package:spring_roll_flutter/Wallet/Screen/transaction_history_screen.dart';
import 'package:intl/intl.dart';

class WalletHomePage extends ConsumerStatefulWidget {
  WalletHomePage({
    Key? key,
  });

  @override
  ConsumerState<WalletHomePage> createState() => _WalletHomePageState();
}

class _WalletHomePageState extends ConsumerState<WalletHomePage> {
  // late WebSocketService _webSocketService;
  bool _isBalanceVisible = false;
  int? id = 0;
  String name = '';
  String number = '';
  double amount = 0.0;
  String rewards = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.watch(indvDahsboardInfoProvider).maybeWhen(
            success: (useryDetails) {
              id = useryDetails!.userId;
              print("the id is ___$id");
              name = useryDetails.userName;
              number = useryDetails.userPhoneNumber;
              amount = useryDetails.walletBalance;
            },
            orElse: () => 'No Logo',
          );
      ref.read(rewardPointsProvider.notifier).rewardPointProvider(id);
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
        error: (value) {
          ToastUtils().showErrorToast(context, "Unable to transfer fund");
        },
      );
    });

    ref.watch(rewardPointsProvider).maybeWhen(
          success: (rewardPoints) {
            rewards = rewardPoints.toString();
          },
          orElse: () => 'No Logo',
        );
    // _webSocketService = WebSocketService(id.toString());

    // Listen to balance updates
    // _webSocketService.balanceStream.listen((message) {
    //   final updatedBalance = jsonDecode(message);
    //   setState(() {
    //     amount = updatedBalance;
    //   });
    // });
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.primary,
              child: Icon(
                Icons.account_circle,
                size: 35,
                color: AppColors.primary,
              ),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditUserProfileScreen()),
                    );
                  },
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
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    _isBalanceVisible
                        ? 'NPR ${annotatedAmount(amount)}'
                        : 'NPR XXXX.XX',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isBalanceVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.primary,
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
              Text(
                'Balance',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    double.tryParse(rewards)?.toStringAsFixed(2) ??
                        '0.00', // Make sure this is a string like '5850.00'
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.workspace_premium,
                    color: AppColors.primary,
                    size: 18,
                  ),
                ],
              ),
              Text(
                'Reward Points',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWalletOptions() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF), // Black background
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
            Icons.history,
            'Transactions',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TransactionHistoryPage(
                          userId: id,
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
                MaterialPageRoute(
                    builder: (context) => ElectricityBillScreen(
                          number: number,
                          userId: id,
                        )),
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
          Icon(
            icon,
            size: 22,
            color: AppColors.primary,
          ), // Smaller icon
          SizedBox(height: 3), // Reduced spacing
          Text(
            label,
            style: TextStyle(
                color: AppColors.primary, fontSize: 10), // Smaller text
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

String annotatedAmount(double amount) {
  try {
    final formatter = NumberFormat('#,##0.##'); // handles decimals too
    return formatter.format(amount);
  } catch (e) {
    return amount.toString(); // safely return string
  }
}
