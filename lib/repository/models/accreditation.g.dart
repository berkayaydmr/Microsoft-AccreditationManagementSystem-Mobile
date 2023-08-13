// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accreditation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accreditation _$AccreditationFromJson(Map<String, dynamic> json) =>
    Accreditation(
      id: json['id'] as int?,
      engineerId: json['engineerId'] as int?,
      mip: json['mip'] == null
          ? null
          : Mip.fromJson(json['mip'] as Map<String, dynamic>),
      isAccredited: json['isAccredited'] as bool?,
    );

Map<String, dynamic> _$AccreditationToJson(Accreditation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'engineerId': instance.engineerId,
      'mip': instance.mip,
      'isAccredited': instance.isAccredited,
    };
