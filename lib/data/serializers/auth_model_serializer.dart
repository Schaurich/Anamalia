import 'package:dowing_app/domain/models/auth_model.dart';

class AuthModelSerializer {
  AuthModelSerializer.of(this.authModel);

  AuthModel authModel;

  static AuthModel fromJson(Map<String, dynamic> json) => AuthModel(
        email: json['email'] as String?,
        emailConfirmed: json['emailConfirmed'] as bool?,
        privacyPolicyAccepted: json['privacyPolicyAccepted'] as bool?,
        userId: json['userId'] as String?,
        accessToken: json['access_token'] as String?,
        accessTokenExpiration: json['accessTokenExpiration'] as String?,
        refreshToken: json['refresh_token'] as String?,
        refreshTokenExpiration: json['refreshTokenExpiration'] as String?,
        isFirstVisit: json['isFirstVisit'] as bool?,
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = authModel.email ?? '';
    data['emailConfirmed'] = authModel.emailConfirmed;
    data['privacyPolicyAccepted'] = authModel.privacyPolicyAccepted;
    data['userId'] = authModel.userId;
    data['access_token'] = authModel.accessToken;
    data['accessTokenExpiration'] = authModel.accessTokenExpiration;
    data['refresh_token'] = authModel.refreshToken;
    data['refreshTokenExpiration'] = authModel.refreshTokenExpiration;
    data['isFirstVisit'] = authModel.isFirstVisit;
    return data;
  }

  static AuthModel fromMap(Map<String, dynamic> map) {
    return AuthModel(
      email: map['email'] as String,
      emailConfirmed: map['emailConfirmed'] as bool?,
      privacyPolicyAccepted: map['privacyPolicyAccepted'] as bool?,
      userId: map['userId'] as String?,
      accessToken: map['access_token'] as String?,
      accessTokenExpiration: map['accessTokenExpiration'] as String?,
      refreshToken: map['refresh_token'] as String?,
      refreshTokenExpiration: map['refreshTokenExpiration'] as String?,
      isFirstVisit: map['isFirstVisit'] as bool?,
    );
  }
}
