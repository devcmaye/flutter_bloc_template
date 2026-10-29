// ################# API Constants######################
//
//Api Constants are confidential , don't upload any public or private server

import 'dart:io';

import '../../app_config/environment_config.dart';

class ApiConstants {
  // Base URL
  static String baseUrl = EnvironmentConfig.isPROD
      ? "http://pension-uat.payme.com.mm:5002/api/ver02"
      : "http://pension-uat.payme.com.mm:5002/api/ver02";

  //User
  static const String getToken = "/endpoint1";

  static const String userCode = "usercode1"; // "payme-pension-mobile";
  static const String apiKey = "TestApiKey";
  static const String channel = "Mobile";
  static const String secretKey = "TestKey";

  //Status Code
  static const String success_status_code = "000";
  static const String failure_status_code = "404";
  //
  // static const String success_status_code = "200";

  //error code
  static const unknown_status_code = "-1";
  static const no_internet_status_code = "-2";

  //Error Message
  static const String session_expired = 'Session expired';

  static const String connection_time_out =
      "Connection timeout. Please try again.";
  static const String no_internet_connection =
      "No internet connection, Please try again";
  static const String invalid_server_response = "Invalid server response";
  static const String network_invalid = "Network Invalid";
  static const String unexpected_network_error = "Unexpected network error";

  static const String empty_result = "Empty result from server!";
  static const String empty_result_list = "Empty result list from server!";
  static const String service_temporary_available =
      "503 Service Temporarily Unavailable";

  //Pagenitation

  static const String startPage = "1";
  static const String defaultPageSize = "50";

  static const String defaultFingerPrint =
      "ebe48222b24ec25cd7e5ada76d9434f23c217843246af207eb7d3e9308367f0b";
  static const String defaultIPAddress = "192.168.1.8";
  static const String dummyString =
      "QR String development has become one of the most ets such as Row Column Stack Expanded Flexible Container Padding Center ListView GridView CustomScrollView and Sliver widgets provide extensive layout capabilities. Understanding layout constraints alignment spacing sizing and rendering behavior helps developers build interfaces that remain attractive and functional on a wide range of devices. Animation further enhances user experience by";
}
