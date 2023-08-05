class PostLearningPathStepRequestModel {
  int? learningPathID;
  String? name;

  PostLearningPathStepRequestModel(
      {this.learningPathID, this.name});

  PostLearningPathStepRequestModel.fromJson(Map<String, dynamic> json) {
    learningPathID = json['learningPathID'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['learningPathID'] = this.learningPathID;
    data['name'] = this.name;
    return data;
  }
}
