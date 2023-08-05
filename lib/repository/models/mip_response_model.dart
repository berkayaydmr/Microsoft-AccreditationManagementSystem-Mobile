

import 'learning_path_response_model.dart';

class MIPResponseModel {
  int? id;
  String? name;
  List<LearningPathResponseModel>? learningPaths;
  int? assignedEngineerCount;
  double? completionRate;

  MIPResponseModel(
      {this.id,
        this.name,
        this.learningPaths,
        this.assignedEngineerCount,
        this.completionRate});

  MIPResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['learningPaths'] != null) {
      learningPaths = <LearningPathResponseModel>[];
      json['learningPaths'].forEach((v) {
        learningPaths!.add(LearningPathResponseModel.fromJson(v));
      });
    }
    assignedEngineerCount = json['assignedEngineerCount'];
    completionRate = json['completionRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    if (learningPaths != null) {
      data['learningPaths'] =
          learningPaths!.map((v) => v.toJson()).toList();
    }
    data['assignedEngineerCount'] = assignedEngineerCount;
    data['completionRate'] = completionRate;
    return data;
  }
}
