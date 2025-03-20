import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/employee/Model/add_model.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final editEmployeeProvider =
    StateNotifierProvider<editEmployeeProviderNotifier, AppState<bool>>((ref) {
  return editEmployeeProviderNotifier(ref);
});

class editEmployeeProviderNotifier extends StateNotifier<AppState<bool>> {
  final Ref ref;

  editEmployeeProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> editEmployeeData(
      int id, String name, String email, String phone) async {
    final dio = ref.read(dioProvider);
    final url = '${ApiConfig.apiUrl}${ApiConfig.employee}/$id';
    final addEmployeeRequest = AddDataModel(
      // id: 1,
      name: name,
      email: email,
      phone: phone,
    );
    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      print("data to be edited are __$name::$email::$phone");
      final response = await dio.put(
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
        final jsonResponse = response.data;
        print("dara edit aayooouuu__$jsonResponse");

        state = AppState.success(data: true);
      } else {
        throw Exception('Failed to load employee details');
      }
    } catch (e) {}
  }
}
