import 'package:json_annotation/json_annotation.dart';

import 'learning_path.dart';

part 'mip.g.dart';

@JsonSerializable()
class Mip {
  final int? id;
  final String? name;
  final List<LearningPath>? learningPaths;
  final double? completionRate;

  Mip({required this.id, required this.name, required this.learningPaths, required this.completionRate});

  factory Mip.fromJson(Map<String, dynamic> json) => _$MipFromJson(json);
}