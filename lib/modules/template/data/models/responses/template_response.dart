import '../../../../../core/network/base_response/base_response.dart';
import '../dtos/template_result_model.dart';

class TemplateResponse extends BaseResponse {
  final TemplateResultModel? result;

  TemplateResponse({
    required super.statusCode,
    required super.status,
    required super.message,
    this.result,
  });

  factory TemplateResponse.fromJson(Map<String, dynamic> json) {
    return TemplateResponse(
      statusCode: json['StatusCode']?.toString() ?? '',
      status: json['Status'] ?? false,
      message: json['Message'] ?? '',
      result: json['Result'] != null
          ? TemplateResultModel.fromJson(json['Result'])
          : null,
    );
  }
}
