class BaseResponse<T> {
  final String statusCode;
  final bool status;
  final String message;
  final T? result;
  final List<T>? results;

  const BaseResponse({
    required this.statusCode,
    required this.status,
    required this.message,
    this.result,
    this.results,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json, {
    required T Function(dynamic json) fromJsonT,
  }) {
    return BaseResponse<T>(
      statusCode: json['StatusCode']?.toString() ?? '',
      status: json['Status'] ?? false,
      message: json['Message'] ?? '',
      result: json['Result'] != null ? fromJsonT(json['Result']) : null,
      results:
          json['Results'] != null
              ? (json['Results'] as List).map((e) => fromJsonT(e)).toList()
              : null,
    );
  }
}
