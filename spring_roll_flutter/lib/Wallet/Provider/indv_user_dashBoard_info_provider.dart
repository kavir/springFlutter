import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/Wallet/Model/fetch_indv_user_model.dart';

final indvDahsboardInfoProvider = StateNotifierProvider<
    IndvUserDashBoardInfoProviderNotifier,
    AppState<FetchIndvUserDataModel>>((ref) {
  return IndvUserDashBoardInfoProviderNotifier(ref);
});

class IndvUserDashBoardInfoProviderNotifier
    extends StateNotifier<AppState<FetchIndvUserDataModel>> {
  final Ref ref;

  IndvUserDashBoardInfoProviderNotifier(this.ref)
      : super(const AppState.initial());
  Future<void> indvInfoProvider() async {
    print("all ok");
    state = const AppState.loading(loading: true);
    final dio = ref.read(dioProvider);
    final number = ref.read(phoneNumberProvider.notifier).state;
    final url = '${ApiConfig.apiUrl}${ApiConfig.wallet}${ApiConfig.userWallet}';
    print("the url is ___$url");
    final queryParams = {
      'number': number,
    };
    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      final response = await dio.get(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        print("the json respojse is __$jsonResponse");
        final customers = FetchIndvUserDataModel.fromJson(jsonResponse);
        print("the parsed indv data is ___$customers");
        state = const AppState.loading(loading: false);
        state = AppState.success(data: customers);
      } else {
        state = const AppState.loading(loading: false);
        state = AppState.error();
      }
    } catch (e) {
      state = const AppState.loading(loading: false);
      state = AppState.error();
    }
  }
}
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:dio/dio.dart';
// import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
// import 'package:spring_roll_flutter/Utils/api_config.dart';
// import 'package:spring_roll_flutter/State/appState.dart';
// import 'package:spring_roll_flutter/Utils/dio_provider.dart';
// import 'package:spring_roll_flutter/Wallet/Model/fetch_indv_user_model.dart';

// final indvDahsboardInfoProvider = StateNotifierProvider<
//     IndvUserDashBoardInfoProviderNotifier,
//     AppState<FetchIndvUserDataModel>>((ref) {
//   return IndvUserDashBoardInfoProviderNotifier(ref);
// });

// class IndvUserDashBoardInfoProviderNotifier
//     extends StateNotifier<AppState<FetchIndvUserDataModel>> {
//   final Ref ref;

//   IndvUserDashBoardInfoProviderNotifier(this.ref)
//       : super(const AppState.initial());
//   Future<void> indvInfoProvider() async {
//     print("all ok");
//     state = const AppState.loading(loading: true);
//     final dio = ref.read(dioProvider);
//     final number = ref.read(phoneNumberProvider.notifier).state;
//     final url = '${ApiConfig.apiUrl}${ApiConfig.wallet}${ApiConfig.userWallet}';
//     print("the indv url is ___$url::::::::$number");
//     final queryParams = {
//       'number': number,
//     };
//     try {
//       final String? token = await ref.read(tokenProvider);
//       final String cleanedToken =
//           token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
//       print("server ma gayo__$cleanedToken");
//       final response = await dio.get(
//         url,
//         queryParameters: queryParams,
//         options: Options(
//           headers: {
//             'Origin': ApiConfig.prodOriginServerUrl,
//             'Authorization': 'Bearer $cleanedToken',
//           },
//         ),
//       );
//       print("yaha samm ni execute vayexaw___");
//       if (response.statusCode == 200) {
//         final jsonResponse = response.data;
//         print("the json respojse is __$jsonResponse");
//         final customers = FetchIndvUserDataModel.fromJson(jsonResponse);
//         print("the parsed indv data is ___$customers");
//         state = const AppState.loading(loading: false);
//         state = AppState.success(data: customers);
//       } else {
//         state = const AppState.loading(loading: false);
//         state = AppState.error();
//       }
//     } catch (e) {
//       state = const AppState.loading(loading: false);
//       state = AppState.error();
//     }
//   }
// }
