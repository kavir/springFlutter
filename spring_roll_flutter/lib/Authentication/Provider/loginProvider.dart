import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Model/loginRequestModel.dart';
import 'package:spring_roll_flutter/Authentication/Model/loginResponseModel.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final tokenProvider = StateProvider<String>((ref) => '');
final phoneNumberProvider = StateProvider<String>((ref) => '');

final loginProvider =
    StateNotifierProvider<LoginProviderNotifier, AppState<LoginResponseModel>>(
        (ref) {
  return LoginProviderNotifier(ref);
});

class LoginProviderNotifier
    extends StateNotifier<AppState<LoginResponseModel>> {
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
        final loginResponse = LoginResponseModel.fromJson(jsonResponse);
        print("the token is __${loginResponse.token}");
        ref.read(tokenProvider.notifier).state = loginResponse.token;
        ref.read(phoneNumberProvider.notifier).state = number;
        // ref.read(tokenProvider.notifier).storeToken(jsonResponse.toString());
        print("login vayo hae guys$jsonResponse");
        state = const AppState.loading(loading: false);
        state = AppState.success(data: loginResponse);
      } else {
        state = const AppState.loading(loading: false);
        state = const AppState.error();
        throw Exception('Failed to load employee details');
      }
    } catch (e) {
      state = const AppState.loading(loading: false);
      state = const AppState.error();
    }
  }
}
