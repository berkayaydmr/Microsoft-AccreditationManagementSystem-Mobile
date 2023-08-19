import 'dart:convert';

import 'package:accreditation_management_system/core/constants/local_storage_constants.dart';
import 'package:accreditation_management_system/core/local_storage/local_storage_manager.dart';
import 'package:accreditation_management_system/repository/models/post_user_request_model.dart';
import 'package:accreditation_management_system/repository/models/register_response.dart';
import 'package:accreditation_management_system/repository/models/user.dart';

import '../../../../../core/network/api.dart';
import 'models/put_engineer_request_model.dart';

abstract class IEngineerRepository {
  IEngineerRepository();
  Future<RegisterResponseModel> createEngineer(PostUserRequestModel createEngineerRequestModel);
  Future<User> putEngineer(PutEngineerRequestModel putEngineerRequestModel);
  Future<List<User>> getEngineers(int pageIndex, int pageSize);
  Future<User> getEngineer(int id);
  Future<String> deleteEngineer(String id);
}

class EngineerRepository extends IEngineerRepository {
  EngineerRepository();

  @override
  Future<RegisterResponseModel> createEngineer(PostUserRequestModel createEngineerRequestModel) async {
    var response = await Api().dio.post("/Auth/Register", data: createEngineerRequestModel.toJson());
    var registerResponseModel = RegisterResponseModel.fromJson(response.data);
    LocalStorageManager.setString(LocalStorageConstants.TOKEN, registerResponseModel.token.toString());
    return registerResponseModel;
  }

  @override
  Future<List<User>> getEngineers(int pageIndex, int pageSize) {
    var response = Api().dio.get("/Users?PageIndex=$pageIndex&PageSize=$pageSize");
    return response.then((value) => value.data["items"].map<User>((e) => User.fromJson(e)).toList());
  }

  @override
  Future<String> deleteEngineer(String id) {
    var response = Api().dio.delete("/engineers/$id");
    return response.then((value) => value.data.toString());
  }

  @override
  Future<User> getEngineer(int id) {
    var response = Api().dio.get("/Users/$id");
    return response.then((value) => User.fromJson(value.data));
  }

  @override
  Future<User> putEngineer(PutEngineerRequestModel putEngineerRequestModel) {
    var response = Api().dio.put("/engineers", data: jsonEncode(putEngineerRequestModel.toJson()));
    return response.then((value) => User.fromJson(value.data));
  }
}
