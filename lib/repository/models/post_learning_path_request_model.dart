
import 'package:accreditation_management_system/repository/models/post_learning_path_step_request_model.dart';

class PostLearningPathRequestModel {
  String? name;
  int? mipID;
  List<PostLearningPathStepRequestModel>? learningSteps;

  PostLearningPathRequestModel({this.name, this.mipID, this.learningSteps});

  PostLearningPathRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mipID = json['mipID'];
    if (json['learningSteps'] != null) {
      learningSteps = <PostLearningPathStepRequestModel>[];
      json['learningSteps'].forEach((v) {
        learningSteps!.add(PostLearningPathStepRequestModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mipID'] = this.mipID;
    if (this.learningSteps != null) {
      data['learningSteps'] =
          this.learningSteps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}