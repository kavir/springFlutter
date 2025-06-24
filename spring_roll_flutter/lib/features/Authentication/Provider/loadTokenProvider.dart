import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tokenStorageProvider =
    StateNotifierProvider<SecureTokenProviderNotifier, String?>((ref) {
  return SecureTokenProviderNotifier(ref);
});

class SecureTokenProviderNotifier extends StateNotifier<String?> {
  final Ref ref;
  static const _storage = FlutterSecureStorage();
  static const _key = 'auth_token';

  SecureTokenProviderNotifier(this.ref) : super(null) {
    _loadToken(); // auto-load on init
  }

  Future<void> storeToken(String token) async {
    await _storage.write(key: _key, value: token);
    state = token;
  }

  Future<void> _loadToken() async {
    final token = await _storage.read(key: _key);
    state = token;
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _key);
    state = null;
  }
  Future<void> initialize() async {
  await _loadToken();
}
}
