import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/features/Authentication/Model/loginRequestModel.dart';
import 'package:spring_roll_flutter/features/Authentication/Model/loginResponseModel.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/loadTokenProvider.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/phoneNumberProvdier.dart';



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
        
        
        print("login huna lagyo");
        await ref.read(tokenStorageProvider.notifier).storeToken(loginResponse.token);
        await ref.read(phoneNumberProvider .notifier).storePhoneNumber(number);


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
      if (e is DioException) {
        final responseData = e.response?.data;
        final errorMessage = responseData is Map && responseData.containsKey('message')
            ? responseData['message'] as String
            : 'Something went wrong';

        state = AppState.generalError(errorMessage: errorMessage);
      } else {
        state = AppState.error();
      }
    }
  }
}
