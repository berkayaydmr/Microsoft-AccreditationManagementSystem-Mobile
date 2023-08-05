
import 'learning_path_step_response_model.dart';

class PutLearningPathRequestModel {
  String? name;
  List<LearningPathStepResponseModel>? learningSteps;
  double? completionRate;

  PutLearningPathRequestModel(
      {this.name, this.learningSteps, this.completionRate});

  PutLearningPathRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['learningSteps'] != null) {
      learningSteps = <LearningPathStepResponseModel>[];
      json['learningSteps'].forEach((v) {
        learningSteps!.add(LearningPathStepResponseModel.fromJson(v));
      });
    }
    completionRate = json['completionRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (learningSteps != null) {
      data['learningSteps'] =
          learningSteps!.map((v) => v.toJson()).toList();
    }
    data['completionRate'] = completionRate;
    return data;
  }
}