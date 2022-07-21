class AuthModel {
  AuthModel({
    this.email,
    this.emailConfirmed,
    this.privacyPolicyAccepted,
    this.userId,
    this.accessToken,
    this.accessTokenExpiration,
    this.refreshToken,
    this.refreshTokenExpiration,
    this.isFirstVisit,
  });

  String? email;
  bool? emailConfirmed;
  bool? privacyPolicyAccepted;
  String? userId;
  String? accessToken;
  String? accessTokenExpiration;
  String? refreshToken;
  String? refreshTokenExpiration;
  bool? isFirstVisit;
}
