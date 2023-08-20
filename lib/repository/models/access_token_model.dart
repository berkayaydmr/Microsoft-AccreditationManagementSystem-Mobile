import 'package:json_annotation/json_annotation.dart';

part 'access_token_model.g.dart';

@JsonSerializable()
class AccessTokenModel {
  final String? token;
  final DateTime? expiration;

  AccessTokenModel({required this.token, required this.expiration});

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) => _$AccessTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenModelToJson(this);
}
