import 'package:json_annotation/json_annotation.dart';

part 'engineer.g.dart';

@JsonSerializable()
class Engineer {
  final int? id;
  final String? name;

  Engineer({required this.id, required this.name});

  factory Engineer.fromJson(Map<String, dynamic> json) => _$EngineerFromJson(json);
}