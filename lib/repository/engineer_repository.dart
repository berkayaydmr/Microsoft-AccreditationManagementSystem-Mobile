import 'dart:convert';

import '../../../../../core/network/api.dart';
import 'models/engineer_response_model.dart';
import 'models/post_engineer_request_model.dart';
import 'models/put_engineer_request_model.dart';


abstract class IEngineerRepository {
  IEngineerRepository();
  Future<String> createEngineer(CreateEngineerRequestModel createEngineerRequestModel);
  void putEngineer(PutEngineerRequestModel putEngineerRequestModel);
  Future<List<EngineerResponseModel>> getEngineers();
  Future<EngineerResponseModel> getEngineer(int id);
  Future<String> deleteEngineer(String id);
}

class EngineerRepository extends IEngineerRepository {
  EngineerRepository();

  @override
  Future<String> createEngineer(CreateEngineerRequestModel createEngineerRequestModel) async {
    var response = await Api().dio.post("/engineers",data:jsonEncode(createEngineerRequestModel.toJson()));
    return response.data.toString();
  }

  @override
  Future<List<EngineerResponseModel>> getEngineers() {
    var response = Api().dio.get("/engineers");
    return response.then((value) => value.data.map<EngineerResponseModel>((e) => EngineerResponseModel.fromJson(e)).toList());
  }

  @override
  Future<String> deleteEngineer(String id) {
    var response = Api().dio.delete("/engineers/$id");
    return response.then((value) => value.data.toString());
  }

  @override
  Future<EngineerResponseModel> getEngineer(int id) {
    var response = Api().dio.get("/engineers/$id");
    return response.then((value) => EngineerResponseModel.fromJson(value.data));
  }

  @override
  void putEngineer(PutEngineerRequestModel putEngineerRequestModel) {
      Api().dio.put("/engineers",data:jsonEncode(putEngineerRequestModel.toJson()));
  }

}