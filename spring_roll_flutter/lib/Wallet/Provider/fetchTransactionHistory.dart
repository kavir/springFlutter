import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/Wallet/Model/fetchTransactionModel.dart';

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
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';

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
        final List<TransactionModel> transactions = List<TransactionModel>.from(
            jsonData.map((json) => TransactionModel.fromJson(json)));
        state = AppState.success(data: transactions);
      } else {
        state = AppState.error();
      }
    } catch (e) {
      state = AppState.error();
    }
  }
}
