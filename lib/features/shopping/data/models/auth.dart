import 'package:clean_architecture/features/shopping/domain/entities/auth.dart';

class AuthModel extends AuthEntity {
  const AuthModel(
      {required super.accessToken, required super.tokenType, required super.expiresIn});

  factory AuthModel.fromJson(Map<String, dynamic> map) {
    return AuthModel(
      accessToken: map['access_token'] ?? 0,
      tokenType: map['token_type'] ?? "",
      expiresIn: map['expires_in'] ?? "",
    );
  }
}
