import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final phoneNumberProvider =
    StateNotifierProvider<SecurePhoneNumberNotifier, String?>((ref) {
  return SecurePhoneNumberNotifier(ref);
});

class SecurePhoneNumberNotifier extends StateNotifier<String?> {
  final Ref ref;
  static const _storage = FlutterSecureStorage();
  static const _key = 'phone_number';

  SecurePhoneNumberNotifier(this.ref) : super(null) {
    _loadPhoneNumber(); // auto-load on init
  }

  Future<void> storePhoneNumber(String phoneNumber) async {
    await _storage.write(key: _key, value: phoneNumber);
    state = phoneNumber;
  }

  Future<void> _loadPhoneNumber() async {
    final phoneNumber = await _storage.read(key: _key);
    state = phoneNumber;
  }

  Future<void> deletePhoneNumber() async {
    await _storage.delete(key: _key);
    state = null;
  }

  Future<void> initialize() async {
    await _loadPhoneNumber();
  }
}
