import 'dart:convert';

import 'package:accreditation_management_system/core/constants/local_storage_constants.dart';
import 'package:accreditation_management_system/core/local_storage/local_storage_manager.dart';
import 'package:accreditation_management_system/repository/models/login_request_model.dart';
import 'package:accreditation_management_system/repository/models/post_user_request_model.dart';
import 'package:accreditation_management_system/repository/models/login_response_model.dart';
import 'package:accreditation_management_system/repository/models/user.dart';

import '../../../../../core/network/api.dart';
import 'models/put_engineer_request_model.dart';

abstract class IUserRepository {
  IUserRepository();
  Future<LoginResponseModel> createUser(PostUserRequestModel createEngineerRequestModel);
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel);
  Future<User> putUser(PutEngineerRequestModel putEngineerRequestModel);
  Future<List<User>> getUsers(int pageIndex, int pageSize);
  Future<User> getUser(int id);
  Future<String> deleteUser(String id);
}

class UserRepository extends IUserRepository {
  UserRepository();

  @override
  Future<LoginResponseModel> createUser(PostUserRequestModel createUserRequestModel) async {
    var response = await Api().dio.post("/Auth/Register", data: createUserRequestModel.toJson());
    var registerResponseModel = LoginResponseModel.fromJson(response.data);
    LocalStorageManager.setString(LocalStorageConstants.TOKEN, registerResponseModel.accessToken.token.toString());
    return registerResponseModel;
  }

  @override
  Future<List<User>> getUsers(int pageIndex, int pageSize) {
    var response = Api().dio.get("/Users?PageIndex=$pageIndex&PageSize=$pageSize");
    return response.then((value) => value.data["items"].map<User>((e) => User.fromJson(e)).toList());
  }

  @override
  Future<String> deleteUser(String id) {
    var response = Api().dio.delete("/engineers/$id");
    return response.then((value) => value.data.toString());
  }

  @override
  Future<User> getUser(int id) {
    var response = Api().dio.get("/Users/$id");
    return response.then((value) => User.fromJson(value.data));
  }

  @override
  Future<User> putUser(PutEngineerRequestModel putUserRequestModel) {
    var response = Api().dio.put("/engineers", data: jsonEncode(putUserRequestModel.toJson()));
    return response.then((value) => User.fromJson(value.data));
  }

  @override
  Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) {
    var response = Api().dio.post("/Auth/Login", data: loginRequestModel.toJson());
    return response.then((value) => LoginResponseModel.fromJson(value.data));
  }
}
