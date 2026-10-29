import 'base_response.dart';

//default response
class ApiResponse extends BaseResponse {
  ApiResponse({
    required super.statusCode,
    required super.status,
    required super.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      statusCode: json['StatusCode']?.toString() ?? '',
      status: json['Status'] ?? false,
      message: json['Message'] ?? '',
    );
  }
}
