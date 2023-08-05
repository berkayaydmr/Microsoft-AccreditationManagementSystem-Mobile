class LearningPathStepResponseModel {
  int? id;
  String? name;
  bool? isCompleted;

  LearningPathStepResponseModel({this.id, this.name, this.isCompleted});

  LearningPathStepResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isCompleted'] = this.isCompleted;
    return data;
  }
}