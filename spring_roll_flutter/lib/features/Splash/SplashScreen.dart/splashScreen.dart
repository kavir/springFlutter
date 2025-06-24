// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/BottomNavigation/bottomNavigation.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/loadTokenProvider.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/phoneNumberProvdier.dart';
import 'package:spring_roll_flutter/features/Authentication/Screen/loginScreen.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), _checkToken);
  }

  Future<void> _checkToken() async {
    final tokenNotifier = ref.read(tokenStorageProvider.notifier);

    // Load token again in case not loaded yet
    await tokenNotifier.initialize();

    final token = ref.read(tokenStorageProvider);
    final number = ref.read(phoneNumberProvider);
    print("the token is in splashswcreen is ___$token");
    print("the token is in splashswcreen is ___$number");

    if (token != null) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const NavigationMenu()),
        );
      }
    } else {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
