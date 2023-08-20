// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      accessToken: AccessTokenModel.fromJson(
          json['accessToken'] as Map<String, dynamic>),
      requiredAuthenticatorType: json['requiredAuthenticatorType'] as String?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'requiredAuthenticatorType': instance.requiredAuthenticatorType,
    };
