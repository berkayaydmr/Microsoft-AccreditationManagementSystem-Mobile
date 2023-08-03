import 'package:accreditation_management_system/repository/models/step.dart';
import 'package:json_annotation/json_annotation.dart';

part 'learning_path.g.dart';

@JsonSerializable()
class LearningPath {
  final int? id;
  final String? name;
  final int? mipId;
  final List<Step>? steps;

  LearningPath({required this.id, required this.name, required this.mipId, required this.steps});

  factory LearningPath.fromJson(Map<String, dynamic> json) => _$LearningPathFromJson(json);
}