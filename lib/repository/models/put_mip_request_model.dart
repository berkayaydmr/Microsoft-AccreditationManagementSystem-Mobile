
import 'learning_path_response_model.dart';

class PutMIPRequestModel {
  String? name;
  List<LearningPathResponseModel>? learningPaths;
  double? completionRate;

  PutMIPRequestModel({this.name, this.learningPaths, this.completionRate});

  PutMIPRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['learningPaths'] != null) {
      learningPaths = <LearningPathResponseModel>[];
      json['learningPaths'].forEach((v) {
        learningPaths!.add(LearningPathResponseModel.fromJson(v));
      });
    }
    completionRate = json['completionRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (learningPaths != null) {
      data['learningPaths'] =
          learningPaths!.map((v) => v.toJson()).toList();
    }
    data['completionRate'] = completionRate;
    return data;
  }
}
