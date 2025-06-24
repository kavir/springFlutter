import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/loadTokenProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/features/Wallet/Model/fetchTransactionModel.dart';

final transactionProvider = StateNotifierProvider<
    TransactionHistoryProviderNotifier,
    AppState<List<TransactionModel>>>((ref) {
  return TransactionHistoryProviderNotifier(ref);
});

class TransactionHistoryProviderNotifier
    extends StateNotifier<AppState<List<TransactionModel>>> {
  final Ref ref;

  TransactionHistoryProviderNotifier(this.ref)
      : super(const AppState.initial());
  Future<void> transaction(int? id, String selectedFilter, String? startDate,
      String? endDate) async {
    state = const AppState.loading(loading: true);
    final dio = ref.read(dioProvider);
    final url = '${ApiConfig.apiUrl}${ApiConfig.transaction}/$id';
    try {
      final String? token = await ref.read(tokenStorageProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '').trim() ?? '';

      final param = {
        "duration": selectedFilter,
        "startDate": startDate,
        "endDate": endDate
      };
      print("the param is __$param");
      final response = await dio.get(
        url,
        queryParameters: param,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        final jsonData = response.data;
        print("the transaction isko _____$jsonData");
        final List<TransactionModel> transactions = List<TransactionModel>.from(
            jsonData.map((json) => TransactionModel.fromJson(json)));
            print("yaha samma thik xaw");
        state = AppState.success(data: transactions);
      } else {
        print("history ko yeta gayo 1");
        state = AppState.error();
      }
    } catch (e) {
      print("history ko yeta gayo 2");
      state = AppState.error();
    }
  }
}
