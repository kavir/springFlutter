class ApiConfig {
  static const String defaultImageUrl =
      "https://minio.silkinv.com/jhattaibooking/1720505353997-squareLogo.png";

// local ko lagi
  // static String prodServerUrl = 'http://192.168.1.81:8080';
  // static String prodOriginServerUrl = 'http://localhost:3000';
  //////////////////////////////////////

  // live ko lagi
  static String prodServerUrl = 'https://springjava.onrender.com';
  static String prodOriginServerUrl = 'http://localhost:8080';
  ////////////////////////////

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
  static const String updateUser = "/updateUser";
  static const String transfer = "/transfer";
  static const String employee = "employees";
  static const String login = "/login";
  static const String register = "/register";
  static const String publicUrl = "/public";
  static const String loginUrl = "/login";
  static const String passwordUrl = "/password";
  static const String getRewardPoints = "/getRewardPoints";
  static const String resetPasswordRequestUrl = "/reset-password-request";
}
