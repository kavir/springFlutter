import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/employee/Model/data_model.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final employeeProvider =
    StateNotifierProvider<BookingProviderNotifier, AppState<List<DataModel>>>(
        (ref) {
  return BookingProviderNotifier(ref);
});

class BookingProviderNotifier extends StateNotifier<AppState<List<DataModel>>> {
  final Ref ref;

  BookingProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> getEmployeeData() async {
    final dio = ref.read(dioProvider);
    final url = '${ApiConfig.apiUrl}${ApiConfig.employee}';
    print("the url is __$url");

    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      state = const AppState.loading(loading: true);
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        if (jsonResponse is List) {
          final List<DataModel> bookingData =
              DataModel.fromJsonList(jsonResponse);
          state = AppState.success(data: bookingData);
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load employee details');
      }
    } catch (e) {
      state = const AppState.error();
    }
  }
}
