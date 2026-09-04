// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
  final String? accessToken;
  final String? encryptedAccessToken;
  final int? expiresIn;
  final int? issuedAt;
  final int? expiresAt;
  final int? sessionExpiresAt;
  final String? tokenType;

  TokenModel({
    this.accessToken,
    this.encryptedAccessToken,
    this.expiresIn,
    this.issuedAt,
    this.expiresAt,
    this.sessionExpiresAt,
    this.tokenType,
  });

  TokenModel copyWith({
    String? accessToken,
    String? encryptedAccessToken,
    int? expiresIn,
    int? issuedAt,
    int? expiresAt,
    int? sessionExpiresAt,
    String? tokenType,
  }) =>
      TokenModel(
        accessToken: accessToken ?? this.accessToken,
        encryptedAccessToken: encryptedAccessToken ?? this.encryptedAccessToken,
        expiresIn: expiresIn ?? this.expiresIn,
        issuedAt: issuedAt ?? this.issuedAt,
        expiresAt: expiresAt ?? this.expiresAt,
        sessionExpiresAt: sessionExpiresAt ?? this.sessionExpiresAt,
        tokenType: tokenType ?? this.tokenType,
      );

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    accessToken: json["access_token"],
    encryptedAccessToken: json["encrypted_access_token"],
    expiresIn: json["expires_in"],
    issuedAt: json["issued_at"],
    expiresAt: json["expires_at"],
    sessionExpiresAt: json["session_expires_at"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "encrypted_access_token": encryptedAccessToken,
    "expires_in": expiresIn,
    "issued_at": issuedAt,
    "expires_at": expiresAt,
    "session_expires_at": sessionExpiresAt,
    "token_type": tokenType,
  };
}
