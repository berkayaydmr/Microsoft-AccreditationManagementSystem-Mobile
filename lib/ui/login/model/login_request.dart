class LoginRequest {
  String? nameAndSurname;

  LoginRequest({this.nameAndSurname});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    nameAndSurname = json['nameAndSurname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameAndSurname'] = nameAndSurname;
    return data;
  }
}