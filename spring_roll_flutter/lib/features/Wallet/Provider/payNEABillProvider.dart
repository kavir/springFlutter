import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/loadTokenProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/phoneNumberProvdier.dart';

final payNEABillProvider =
    StateNotifierProvider<PayNEABillNotifier, AppState<String>>((ref) {
  return PayNEABillNotifier(ref);
});

class PayNEABillNotifier extends StateNotifier<AppState<String>> {
  final Ref ref;

  PayNEABillNotifier(this.ref) : super(const AppState.initial());
  Future<void> payNEA(String number, int billId, String mpin) async {
    state = const AppState.loading(loading: true);
    final dio = ref.read(dioProvider);
    final number = ref.read(phoneNumberProvider.notifier).state;
    final url = '${ApiConfig.apiUrl}${ApiConfig.meter}${ApiConfig.pay}/$billId';
    print("the number data are ___$number");
    print("the id data are ___$billId");
    print("the url data are ___$url");
    final queryParams = {
      'number': number,
      'mpin': mpin,
    };
    try {
      final String? token = await ref.read(tokenStorageProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '').trim() ?? '';
      print("the token is ___$cleanedToken");

      final response = await dio.post(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
      );
      print("yeta samma aayo");
      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        print("the json after payment __$jsonResponse");
        // final responseData = String.fromJson(jsonResponse);
        state = AppState.success(data: jsonResponse.toString());
      } else {
        state = AppState.error();
      }
    } catch (e) {
      state = AppState.error();
    }
  }
}
