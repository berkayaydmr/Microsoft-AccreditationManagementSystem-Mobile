import 'package:json_annotation/json_annotation.dart';

part 'post_user_request_model.g.dart';

@JsonSerializable()
class PostUserRequestModel {
  final String? firstName;
  final String? lastname;
  final String? username;
  final String? password;
  final String? email;
  final int? userRole;

  PostUserRequestModel({required this.firstName, required this.lastname, required this.username, required this.password, required this.email, required this.userRole});

  factory PostUserRequestModel.fromJson(Map<String, dynamic> json) => _$PostUserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostUserRequestModelToJson(this);
}
