import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Model/registerRequestModel.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final registerProvider =
    StateNotifierProvider<RegisterProviderNotifier, AppState<String>>((ref) {
  return RegisterProviderNotifier(ref);
});

class RegisterProviderNotifier extends StateNotifier<AppState<String>> {
  final Ref ref;

  RegisterProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> register(String username, String firstname, String lastname,
      String number, String password, String role) async {
    final dio = ref.read(dioProvider);
    const url = ApiConfig.register;
    final data = RegisterRequestModel(
        username: username,
        firstname: firstname,
        lastname: lastname,
        number: number,
        password: password,
        role: role);
    print("the registered data are___$username::::$password:::$url");
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
        print("register vayo hae guys$jsonResponse");
        state = AppState.success(data: jsonResponse.toString());
      } else {
        throw Exception('Failed to load employee details');
      }
    } catch (e) {
      state = const AppState.error();
    }
  }
}
