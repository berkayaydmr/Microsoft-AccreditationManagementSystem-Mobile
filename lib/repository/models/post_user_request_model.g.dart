// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_user_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostUserRequestModel _$PostUserRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostUserRequestModel(
      firstName: json['firstName'] as String?,
      lastname: json['lastname'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      userRole: json['userRole'] as int?,
    );

Map<String, dynamic> _$PostUserRequestModelToJson(
        PostUserRequestModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastname': instance.lastname,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'userRole': instance.userRole,
    };
