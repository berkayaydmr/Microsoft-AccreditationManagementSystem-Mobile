class PutLearningPathStepRequestModel {
  String? name;
  bool? isCompleted;

  PutLearningPathStepRequestModel({this.name, this.isCompleted});

  PutLearningPathStepRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}