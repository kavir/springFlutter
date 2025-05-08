import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Utils/constants/colors.dart';
import 'package:spring_roll_flutter/Wallet/Provider/indv_user_dashBoard_info_provider.dart';
import 'package:spring_roll_flutter/Wallet/Screen/qrScannerPage.dart';
import 'package:spring_roll_flutter/Wallet/Screen/wallet_home_screen.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

final loggedOutProvider = StateProvider<bool>((ref) => false);
final warehouseIdProvider = StateProvider<int?>((ref) => null);

class NavigationMenu extends ConsumerStatefulWidget {
  const NavigationMenu({super.key});

  @override
  ConsumerState<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends ConsumerState<NavigationMenu>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int warehouseId = 0;
  String errorMessage = "";
  bool isLoadingCustomers = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(indvDahsboardInfoProvider.notifier).indvInfoProvider();
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String number = '';
  @override
  Widget build(BuildContext context) {
    final isLoggedOut = ref.watch(loggedOutProvider);

    if (isLoggedOut) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(warehouseIdProvider.notifier).state = 0;
      });

      setState(() {
        warehouseId = 0;
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (warehouseId != 0) {}
    });
///////////////////////////////////////////////////////////////////////////////////////////////
    ref.watch(indvDahsboardInfoProvider).maybeWhen(
        success: (useryDetails) {
          number = useryDetails!.userPhoneNumber;
        },
        orElse: () => 'No Logo');

    List<Widget> children = [
      Builder(
        builder: (context) {
          final asyncWarehouseData = ref.watch(indvDahsboardInfoProvider);
          return asyncWarehouseData.maybeWhen(
            orElse: () {
              return const Text("orelse");
            },
            loginError: (errorMessage) => Text(errorMessage ?? ""),
            // loading: (loading) => Center(
            //   child: LoadingAnimationWidget.dotsTriangle(
            //     color: AppColors.primary,
            //     size: 50,
            //   ),
            // ),
            success: (UserDetail) {
              final warehouseProductDetails = UserDetail;

              return WalletHomePage();
            },
            error: (error) =>
                Center(child: Text("Failed to load POS products: $error")),
          );
        },
      ),
      Builder(
        builder: (context) {
          final asyncWarehouseData = ref.watch(indvDahsboardInfoProvider);
          return asyncWarehouseData.maybeWhen(
            orElse: () {
              return const Text("orelse");
            },
            loginError: (errorMessage) => Text(errorMessage ?? ""),
            // loading: (loading) => Center(
            //   child: LoadingAnimationWidget.dotsTriangle(
            //     color: AppColors.primary,
            //     size: 50,
            //   ),
            // ),
            success: (UserDetail) {
              final warehouseProductDetails = UserDetail;

              return WalletHomePage();
            },
            error: (error) =>
                Center(child: Text("Failed to load POS products: $error")),
          );
        },
      ),
      Builder(
        builder: (context) {
          final asyncWarehouseData = ref.watch(indvDahsboardInfoProvider);
          return asyncWarehouseData.maybeWhen(
            orElse: () {
              return const Text("orelse");
            },
            loginError: (errorMessage) => Text(errorMessage ?? ""),
            // loading: (loading) => Center(
            //   child: LoadingAnimationWidget.dotsTriangle(
            //     color: AppColors.primary,
            //     size: 50,
            //   ),
            // ),
            success: (UserDetail) {
              final warehouseProductDetails = UserDetail;

              return WalletHomePage();
            },
            error: (error) =>
                Center(child: Text("Failed to load POS products: $error")),
          );
        },
      ),
      Builder(
        builder: (context) {
          final asyncWarehouseData = ref.watch(indvDahsboardInfoProvider);
          return asyncWarehouseData.maybeWhen(
            orElse: () {
              return const Text("orelse");
            },
            loginError: (errorMessage) => Text(errorMessage ?? ""),
            // loading: (loading) => Center(
            //   child: LoadingAnimationWidget.dotsTriangle(
            //     color: AppColors.primary,
            //     size: 50,
            //   ),
            // ),
            success: (UserDetail) {
              final warehouseProductDetails = UserDetail;

              return WalletHomePage();
            },
            error: (error) =>
                Center(child: Text("Failed to load POS products: $error")),
          );
        },
      ),
      Builder(
        builder: (context) {
          final asyncWarehouseData = ref.watch(indvDahsboardInfoProvider);
          return asyncWarehouseData.maybeWhen(
            orElse: () {
              return const Text("orelse");
            },
            loginError: (errorMessage) => Text(errorMessage ?? ""),
            success: (UserDetail) {
              final warehouseProductDetails = UserDetail;

              return WalletHomePage();
            },
            error: (error) =>
                Center(child: Text("Failed to load POS products: $error")),
          );
        },
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: children[_currentIndex],
      bottomNavigationBar: StylishBottomBar(
        currentIndex: _currentIndex,
        hasNotch: true,
        backgroundColor: Color(0xFFB04E6D),
        notchStyle: NotchStyle.circle,
        option: AnimatedBarOptions(
          opacity: 0.3,
          iconStyle: IconStyle.animated,
        ),
        items: [
          BottomBarItem(
              icon: Image.asset(
                'assets/icons_figma/${_currentIndex == 0 ? 'animatedDashboard3.gif' : 'animatedDashboardGrey.gif'}',
                height: 30,
                width: 30,
              ),
              title: const Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              selectedColor: Colors.white),
          BottomBarItem(
              icon: Image.asset(
                'assets/icons_figma/${_currentIndex == 1 ? 'fileGreen2.png' : 'fileGrey.png'}',
                height: 25,
                width: 25,
              ),
              title: const Text(
                'POS',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              selectedColor: AppColors.primary),
          BottomBarItem(
            icon: const SizedBox(
              width: 30,
            ),
            title: const SizedBox.shrink(),
            selectedColor: Colors.transparent,
          ),
          BottomBarItem(
              icon: Image.asset(
                'assets/icons_figma/${_currentIndex == 3 ? 'moneyGreen.png' : 'moneyGrey.png'}',
                height: 25,
                width: 25,
              ),
              title: const Text(
                'Expense',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              selectedColor: AppColors.primary),
          BottomBarItem(
              icon: Image.asset(
                'assets/icons_figma/${_currentIndex == 4 ? 'animatedProfile.gif' : 'profileGrey.gif'}',
                height: 30,
                width: 30,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              selectedColor: AppColors.primary),
        ],
        onTap: onTabTapped,
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QRScannerPage(
                      userPhoneNumber: number,
                    )),
          );
        },
        backgroundColor: Color(0xFFB04E6D),
        child: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
