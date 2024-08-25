import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? accessToken;
  final String? tokenType;
  final int? expiresIn;

  const AuthEntity(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn});

  @override
  List<Object?> get props {
    return [accessToken, tokenType, expiresIn];
  }
}
