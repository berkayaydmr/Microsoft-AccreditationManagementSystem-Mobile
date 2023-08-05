
import 'mip_response_model.dart';

class EngineerResponseModel {
  int? id;
  String? name;
  List<MIPResponseModel>? accreditations;

  EngineerResponseModel({this.id, this.name, this.accreditations});

  EngineerResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['accreditations'] != null) {
      accreditations = <MIPResponseModel>[];
      json['accreditations'].forEach((v) {
        accreditations!.add(MIPResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.accreditations != null) {
      data['accreditations'] =
          this.accreditations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}