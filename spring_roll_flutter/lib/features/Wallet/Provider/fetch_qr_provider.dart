import 'dart:typed_data';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/loadTokenProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final qrProvider =
    StateNotifierProvider<QRProviderNotifier, AppState<Uint8List>>(
  (ref) {
    return QRProviderNotifier(ref);
  },
);

class QRProviderNotifier extends StateNotifier<AppState<Uint8List>> {
  final Ref ref;

  QRProviderNotifier(this.ref) : super(const AppState.initial());

  Future<void> generateQR(String number) async {
    final dio = ref.read(dioProvider);
    final url =
        '${ApiConfig.apiUrl}${ApiConfig.qr}${ApiConfig.generate}/$number';

    try {
      final String? token = await ref.read(tokenStorageProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '').trim() ?? '';

      final response = await dio.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Origin': ApiConfig.prodOriginServerUrl,
            'Authorization': 'Bearer $cleanedToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        dynamic qrCodeImageBytes = response.data;
        state = AppState.success(data: qrCodeImageBytes as Uint8List);
      } else {
        state = AppState.error();
      }
    } catch (e) {
      state = AppState.error();
    }
  }
}
