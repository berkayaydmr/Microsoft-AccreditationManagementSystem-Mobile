// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mip _$MipFromJson(Map<String, dynamic> json) => Mip(
      id: json['id'] as int?,
      name: json['name'] as String?,
      learningPaths: (json['learningPaths'] as List<dynamic>?)
          ?.map((e) => LearningPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      completionRate: (json['completionRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MipToJson(Mip instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'learningPaths': instance.learningPaths,
      'completionRate': instance.completionRate,
    };
