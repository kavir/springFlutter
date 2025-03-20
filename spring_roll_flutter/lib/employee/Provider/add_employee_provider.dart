import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/employee/Model/add_model.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final addEmployeeProvider =
    StateNotifierProvider<addEmployeeProviderNotifier, AppState<bool>>((ref) {
  return addEmployeeProviderNotifier(ref);
});

class addEmployeeProviderNotifier extends StateNotifier<AppState<bool>> {
  final Ref ref;

  addEmployeeProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> addEmployeeData(String name, String email, String phone) async {
    state = const AppState.loading(loading: true); // Set loading state
    final dio = ref.read(dioProvider);
    const url = '${ApiConfig.apiUrl}${ApiConfig.employee}';
    final addEmployeeRequest = AddDataModel(
      name: name,
      email: email,
      phone: phone,
    );
    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      print(
          "data to be posted siuuuu are __$name::$email::$phone::::$cleanedToken");
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
        data: addEmployeeRequest.toJson(),
      );
      if (response.statusCode == 200) {
        state = AppState.success(data: true);
      } else {
        state = AppState.error(data: true);
      }
    } catch (e) {
      state = AppState.error(data: true);
    }
  }
}
