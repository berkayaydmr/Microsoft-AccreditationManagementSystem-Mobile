// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step _$StepFromJson(Map<String, dynamic> json) => Step(
      id: json['id'] as int?,
      learningPathId: json['learningPathId'] as int?,
      name: json['name'] as String?,
      learningPath: json['learningPath'] == null
          ? null
          : LearningPath.fromJson(json['learningPath'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StepToJson(Step instance) => <String, dynamic>{
      'id': instance.id,
      'learningPathId': instance.learningPathId,
      'name': instance.name,
      'learningPath': instance.learningPath,
    };
