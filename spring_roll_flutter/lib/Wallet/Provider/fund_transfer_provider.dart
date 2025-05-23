import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Wallet/Model/TransferModel.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/Wallet/Model/fund_transfer_response_model.dart';

final fundTransferProvider = StateNotifierProvider<fundTransferProviderNotifier,
    AppState<FundTransferResponseModel>>((ref) {
  return fundTransferProviderNotifier(ref);
});

class fundTransferProviderNotifier
    extends StateNotifier<AppState<FundTransferResponseModel>> {
  final Ref ref;

  fundTransferProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> fundTransfer(
      String receiverNumber, String amount, String mpin) async {
    state = const AppState.loading(loading: true);
    final dio = ref.read(dioProvider);
    final number = ref.read(phoneNumberProvider.notifier).state;
    final stringNumber = number.toString();
    final url = '${ApiConfig.apiUrl}${ApiConfig.wallet}${ApiConfig.transfer}';
    final doubleAmount = double.tryParse(amount);
    final cleanedReceiverNumber = receiverNumber.replaceAll(RegExp(r'\s+'), '');
    final queryParams = {
      'senderNumber': stringNumber,
      'receiverNumber': cleanedReceiverNumber,
      'amount': doubleAmount,
      'mpin': mpin,
    };
    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      print(
          "data to be transferred siuuuu are __$stringNumber:::$cleanedReceiverNumber::$doubleAmount::::$mpin");
      print("the querry param is ___$queryParams");
      final response = await dio.post(
        url,
        queryParameters: queryParams,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
      );
      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        print("the json respojse is __$jsonResponse");
        final responseData = FundTransferResponseModel.fromJson(jsonResponse);
        state = AppState.success(data: responseData);
      } else {
        state = AppState.error();
      }
    } catch (e) {
      state = AppState.error();
    }
  }
}
