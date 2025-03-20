import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final deleteEmployeeProvider =
    StateNotifierProvider<DeleteEmployeeProviderNotifier, AppState<bool>>(
        (ref) {
  return DeleteEmployeeProviderNotifier(ref);
});

class DeleteEmployeeProviderNotifier extends StateNotifier<AppState<bool>> {
  final Ref ref;

  DeleteEmployeeProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> deleteEmployee(int id) async {
    print("id is __$id");
    final dio = ref.read(dioProvider);
    final url = '${ApiConfig.apiUrl}${ApiConfig.employee}/$id';

    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      final response = await dio.delete(
        url,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
            // 'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print("yaaay delete vayo ___");
        state = AppState.success(data: true);
      } else {
        throw Exception('Failed to load employee details');
      }
    } catch (e) {
      state = const AppState.error();
    }
  }
}
