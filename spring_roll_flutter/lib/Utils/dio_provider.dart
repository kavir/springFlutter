import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spring_roll_flutter/Utils/api_config.dart';

final dioProvider = Provider((ref) => _getdio());
Dio _getdio() {
  Dio dio = Dio();
  dio.options.baseUrl = ApiConfig.prodServerUrl;
  return dio;
}
