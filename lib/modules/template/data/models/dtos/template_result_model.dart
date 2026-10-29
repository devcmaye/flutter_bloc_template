class TemplateResultModel {
  final String authSessionId;
  final String userId;
  final String sessionId;
  final String refreshToken;
  final String accessToken;
  final DateTime expiryAt;
  final String status;

  TemplateResultModel({
    required this.authSessionId,
    required this.userId,
    required this.sessionId,
    required this.refreshToken,
    required this.accessToken,
    required this.expiryAt,
    required this.status,
  });

  factory TemplateResultModel.fromJson(Map<String, dynamic> json) {
    return TemplateResultModel(
      authSessionId: json['AuthsessionId'],
      userId: json['UserId'],
      sessionId: json['SessionId'],
      refreshToken: json['RefreshToken'],
      accessToken: json['AccessToken'],
      expiryAt: DateTime.parse(json['ExpiryAt']),
      status: json['Status'],
    );
  }
}
