import 'package:json_annotation/json_annotation.dart';

import 'access_token_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final AccessTokenModel accessToken;
  final String? requiredAuthenticatorType;

  LoginResponseModel({required this.accessToken, required this.requiredAuthenticatorType});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}
