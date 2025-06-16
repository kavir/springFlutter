import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/Wallet/Model/fetch_electricity_bill_model.dart';

final electricityBillProvider = StateNotifierProvider<
    ElectricityBillProviderNotifier,
    AppState<List<FetchElectricityBillModel>>>((ref) {
  return ElectricityBillProviderNotifier(ref);
});

class ElectricityBillProviderNotifier
    extends StateNotifier<AppState<List<FetchElectricityBillModel>>> {
  final Ref ref;

  ElectricityBillProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> getBills(int? id) async {
    state = const AppState.loading(loading: true);
    final dio = ref.read(dioProvider);
    final url = '${ApiConfig.apiUrl}${ApiConfig.meter}${ApiConfig.bills}/$id';
    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      print("yaha samma pugyo");

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
        print("The response is: ___$response");

        // Access the data from the response
        final jsonData = response.data;
        print("The raw JSON data is: ___$jsonData");

        try {
          if (jsonData is List) {
            final List<FetchElectricityBillModel> electricityBills =
                List<FetchElectricityBillModel>.from(
              jsonData.map((json) => FetchElectricityBillModel.fromJson(json)),
            );
            print("The electricity bills are: ___$electricityBills");

            state = AppState.success(data: electricityBills);
          } else {
            print("Error: Expected a list, but got ${jsonData.runtimeType}");
          }
        } catch (e) {
          print("Error while parsing data: $e");
        }
      } else {
        state = AppState.error();
      }
    } catch (e) {
      state = AppState.error();
    }
  }
}
