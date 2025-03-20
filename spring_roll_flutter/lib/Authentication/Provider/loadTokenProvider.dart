// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:spring_roll_flutter/State/appState.dart';

// final tokenProvider =
//     StateNotifierProvider<LoadTokenProviderNotifier, AppState<String>>((ref) {
//   return LoadTokenProviderNotifier(ref);
// });

// class LoadTokenProviderNotifier extends StateNotifier<AppState<String>> {
//   final Ref ref;

//   LoadTokenProviderNotifier(this.ref) : super(const AppState.initial());

//   // Store token in SharedPreferences
//   Future<void> storeToken(String token) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('auth_token', token);
//   }

//   // Retrieve token from SharedPreferences
//   Future<String?> retrieveToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('auth_token');
//   }

//   // Delete token from SharedPreferences
//   Future<void> deleteToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('auth_token');
//   }
// }

// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// // import 'package:hooks_riverpod/hooks_riverpod.dart';
// // import 'package:spring_roll_flutter/State/appState.dart';

// // final tokenProvider =
// //     StateNotifierProvider<LoadTokenProviderNotifier, AppState<String>>((ref) {
// //   return LoadTokenProviderNotifier(ref);
// // });

// // class LoadTokenProviderNotifier extends StateNotifier<AppState<String>> {
// //   final Ref ref;

// //   LoadTokenProviderNotifier(this.ref) : super(const AppState.initial());

// //   Future<void> storeToken(String token) async {
// //     final FlutterSecureStorage secureStorage = FlutterSecureStorage();
// //     await secureStorage.write(key: 'auth_token', value: token);
// //   }

// //   Future<String?> retrieveToken() async {
// //     final FlutterSecureStorage secureStorage = FlutterSecureStorage();
// //     return await secureStorage.read(key: 'auth_token');
// //   }

// //   Future<void> deleteToken() async {
// //     final FlutterSecureStorage secureStorage = FlutterSecureStorage();
// //     await secureStorage.delete(key: 'auth_token');
// //   }
// // }
