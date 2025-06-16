import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';
import 'package:spring_roll_flutter/Wallet/Model/editUserProfileRequestModel.dart';

final editUserProfileProvider =
    StateNotifierProvider<PayNEABillNotifier, AppState<String>>((ref) {
  return PayNEABillNotifier(ref);
});

class PayNEABillNotifier extends StateNotifier<AppState<String>> {
  final Ref ref;

  PayNEABillNotifier(this.ref) : super(const AppState.initial());
  Future<void> editUser(String id, String firstName, String lastName,
      String editedNumber, String profilePicture) async {
    state = const AppState.loading(loading: true);
    final dio = ref.read(dioProvider);
    final number = ref.read(phoneNumberProvider.notifier).state;
    final url = '${ApiConfig.apiUrl}${ApiConfig.wallet}${ApiConfig.updateUser}';
    print("the number data are ___$number");
    print("the id data are ___$identical(a, b)");
    print("the url data are ___$url");

    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
      print("the token is ___$cleanedToken");
      final data = EditUserProfileModel(
        number: number,
        firstName: firstName,
        lastName: lastName,
        editedNumber: editedNumber,
        ProfilePicture: profilePicture,
      );
      print("the data to be edited is _____$data");
      final response = await dio.put(
        url,
        // queryParameters: queryParams,
        options: Options(
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
        data: data.toJson(),
      );
      print("yeta samma aayo");
      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        print("the json after payment __$jsonResponse");
        // final responseData = String.fromJson(jsonResponse);
        state = AppState.success(data: jsonResponse.toString());
      } else {
        state = AppState.error();
      }
    } catch (e) {
      state = AppState.error();
    }
  }
}
