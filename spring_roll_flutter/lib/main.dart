import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Authentication/Screen/loginScreen.dart';
import 'package:spring_roll_flutter/Wallet/Screen/wallet_home_screen.dart';
import 'package:spring_roll_flutter/employee/Screen/fetch_data.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring Boot API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: LoginScreen(),
      // home: EmployeeApp(),
    );
  }
}
