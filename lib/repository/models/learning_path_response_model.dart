
import 'learning_path_step_response_model.dart';

class LearningPathResponseModel {
  int? id;
  String? name;
  int? mipID;
  List<LearningPathStepResponseModel>? learningSteps;
  double? completionRate;

  LearningPathResponseModel(
      {this.id,
        this.name,
        this.mipID,
        this.learningSteps,
        this.completionRate});

  LearningPathResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mipID = json['mipID'];
    if (json['learningSteps'] != null) {
      learningSteps = <LearningPathStepResponseModel>[];
      json['learningSteps'].forEach((v) {
        learningSteps!.add(LearningPathStepResponseModel.fromJson(v));
      });
    }
    completionRate = json['completionRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['id'] = id;
    data['name'] = name;
    data['mipID'] = mipID;
    if (learningSteps != null) {
      data['learningSteps'] =
          learningSteps!.map((v) => v.toJson()).toList();
    }
    data['completionRate'] = completionRate;
    return data;
  }
}