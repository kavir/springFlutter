class ApiConfig {
  static const String defaultImageUrl =
      "https://minio.silkinv.com/jhattaibooking/1720505353997-squareLogo.png";

  // static String prodServerUrl = 'http://192.168.1.94:5052';
  // static String prodOriginServerUrl = 'http://localhost:3000';
  //////////////////////////////////////
  static String prodServerUrl =
      'https://springjava-production-e579.up.railway.app';
  // static String prodServerUrl = 'http://192.168.1.81:9090';
  static String prodOriginServerUrl = 'http://localhost:8080';
  // static String prodServerUrl = 'https://api.billin.space';
  // static String prodOriginServerUrl = '';

  // static void updateServerUrl(String? selectedSpace, WidgetRef ref) async {
  //   final localStorageSpace = ref.read(loadLocalStorageSpaceProvider.notifier);

  //   final storedUrl = await localStorageSpace.loadCurrentSpace();
  //   if (selectedSpace != null && selectedSpace.isNotEmpty) {
  //     prodOriginServerUrl = 'https://$selectedSpace.billin.space';
  //   } else if (storedUrl != null && storedUrl.isNotEmpty) {
  //     prodOriginServerUrl = 'https://$storedUrl.billin.space';
  //   } else {
  //     throw Exception("No space available to set prodOriginServerUrl!");
  //   }
  // }

  static String prodOriginLocalServerUrl = 'http://localhost:3000';
  ////////////////////////////////////////////////////////////////////////
  static const String apiUrl = "/api";
  static const String meter = "/meter";
  static const String bills = "/bills";
  static const String pay = "/pay";
  static const String transaction = "/transactions";
  static const String wallet = "/wallet";
  static const String qr = "/qr";
  static const String generate = "/generate";
  static const String userWallet = "/userWallet";
  static const String transfer = "/transfer";
  static const String employee = "employees";
  static const String login = "/login";
  static const String register = "/register";
  static const String publicUrl = "/public";
  static const String loginUrl = "/login";
  static const String passwordUrl = "/password";
  static const String resetPasswordRequestUrl = "/reset-password-request";
}
