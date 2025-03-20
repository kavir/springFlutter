import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Model/loginRequestModel.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final tokenProvider = StateProvider<String>((ref) => '');
final phoneNumberProvider = StateProvider<String>((ref) => '');

final loginProvider =
    StateNotifierProvider<LoginProviderNotifier, AppState<String>>((ref) {
  return LoginProviderNotifier(ref);
});

class LoginProviderNotifier extends StateNotifier<AppState<String>> {
  final Ref ref;

  LoginProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> login(String number, String password) async {
    final dio = ref.read(dioProvider);
    const url = ApiConfig.login;
    final data = LoginRequestModel(number: number, password: password);
    print("the data are___$number::::$password:::$url");
    try {
      state = const AppState.loading(loading: true);
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
          },
        ),
        data: data.toJson(),
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        ref.read(tokenProvider.notifier).state = jsonResponse.toString();
        ref.read(phoneNumberProvider.notifier).state = number;
        // ref.read(tokenProvider.notifier).storeToken(jsonResponse.toString());
        print("login vayo hae guys$jsonResponse");
        state = AppState.success(data: jsonResponse.toString());
      } else {
        throw Exception('Failed to load employee details');
      }
    } catch (e) {
      state = const AppState.error();
    }
  }
}
