import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/features/Authentication/Screen/loginScreen.dart';
import 'package:spring_roll_flutter/features/Splash/SplashScreen.dart/splashScreen.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //  bool _isInitialized = false;

  // void _onInitializationComplete() {
  //   setState(() {
  //     _isInitialized = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring Boot API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: SplashScreen(),
      // home: LoginScreen(),
    );
  }
}
