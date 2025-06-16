import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';
import 'package:spring_roll_flutter/State/appState.dart';
import 'package:spring_roll_flutter/Utils/dio_provider.dart';

final rewardPointsProvider =
    StateNotifierProvider<RewardPointsProviderNotifier, AppState<String>>(
        (ref) {
  return RewardPointsProviderNotifier(ref);
});

class RewardPointsProviderNotifier extends StateNotifier<AppState<String>> {
  final Ref ref;

  RewardPointsProviderNotifier(this.ref) : super(const AppState.initial());
  Future<void> rewardPointProvider(int? userId) async {
    print("reward all ok___$userId");
    state = const AppState.loading(loading: true);
    final dio = ref.read(dioProvider);
    final url = '${ApiConfig.apiUrl}${ApiConfig.getRewardPoints}/$userId';

    try {
      final String? token = await ref.read(tokenProvider);
      final String cleanedToken =
          token?.replaceAll(RegExp(r'token:|[{}]'), '')?.trim() ?? '';
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
        print("the reward json respojse is __$jsonResponse");
        // state = const AppState.loading(loading: false);
        state = AppState.success(data: jsonResponse);
      } else {
        print("yaha gayo ni tw guys");
        state = const AppState.loading(loading: false);
        state = AppState.error();
      }
    } catch (e) {
      state = const AppState.loading(loading: false);
      state = AppState.error();
    }
  }
}
