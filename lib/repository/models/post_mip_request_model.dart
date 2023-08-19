import 'package:accreditation_management_system/repository/models/post_learning_path_request_model.dart';

import 'learning_path_response_model.dart';

class PostMIPRequestModel {
  String? name;
  List<PostLearningPathRequestModel>? learningPaths;

  PostMIPRequestModel({this.name, this.learningPaths});

  PostMIPRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['learningPaths'] != null) {
      learningPaths = <PostLearningPathRequestModel>[];
      json['learningPaths'].forEach((v) {
        learningPaths!.add(PostLearningPathRequestModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['name'] = this.name;
    if (learningPaths != null) {
      data['learningPaths'] = learningPaths!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
