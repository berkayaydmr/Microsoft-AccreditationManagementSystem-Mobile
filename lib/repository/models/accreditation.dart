import 'package:accreditation_management_system/repository/models/mip.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accreditation.g.dart';

@JsonSerializable()
class Accreditation {
  final int? id;
  final int? engineerId;
  final Mip? mip;
  final bool? isAccredited;

  Accreditation({this.id, this.engineerId, this.mip, this.isAccredited});

  factory Accreditation.fromJson(Map<String, dynamic> json) =>
      _$AccreditationFromJson(json);
}
