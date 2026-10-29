import '../../../../../../core/network/base_response/hash_base_request.dart';

class TemplateRequest implements HashBaseRequest {
  final String agentCode;
  final String apiKey;
  final String deviceId;
  final String channel;
  final String userType;
  final String requestUserId;
  final String? hashValue;

  TemplateRequest({
    required this.agentCode,
    required this.apiKey,
    required this.deviceId,
    required this.channel,
    required this.userType,
    required this.requestUserId,
    this.hashValue,
  });

  TemplateRequest copyWith({
    String? agentCode,
    String? apiKey,
    String? deviceId,
    String? channel,
    String? userType,
    String? requestUserId,
    String? hashValue,
  }) {
    return TemplateRequest(
      agentCode: agentCode ?? this.agentCode,
      apiKey: apiKey ?? this.apiKey,
      deviceId: deviceId ?? this.deviceId,
      channel: channel ?? this.channel,
      userType: userType ?? this.userType,
      requestUserId: requestUserId ?? this.requestUserId,
      hashValue: hashValue ?? this.hashValue,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "AgentCode": agentCode,
      "ApiKey": apiKey,
      "DeviceId": deviceId,
      "Channel": channel,
      "UserType": userType,
      "RequestUserId": requestUserId,
      if (hashValue != null) "HashValue": hashValue,
    };
  }
}
