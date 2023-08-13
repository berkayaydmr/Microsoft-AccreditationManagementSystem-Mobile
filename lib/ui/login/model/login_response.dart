class LoginResponse {
  int? userID;

  LoginResponse({this.userID});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userID'] = userID;
    return data;
  }
}