// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_path.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningPath _$LearningPathFromJson(Map<String, dynamic> json) => LearningPath(
      id: json['id'] as int?,
      name: json['name'] as String?,
      mipId: json['mipId'] as int?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LearningPathToJson(LearningPath instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mipId': instance.mipId,
      'steps': instance.steps,
    };
