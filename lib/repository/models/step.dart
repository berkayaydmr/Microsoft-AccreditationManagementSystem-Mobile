import 'package:accreditation_management_system/repository/models/learning_path.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step.g.dart';

@JsonSerializable()
class Step {
  final int? id;
  final int? learningPathId;
  final String? name;
  final LearningPath? learningPath;

  Step({required this.id, required this.learningPathId, required this.name, required this.learningPath});

  factory Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);
}