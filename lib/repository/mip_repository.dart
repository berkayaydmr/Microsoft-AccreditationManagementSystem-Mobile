import 'package:accreditation_management_system/repository/models/mip.dart';
import 'package:accreditation_management_system/repository/models/post_mip_request_model.dart';

import '../core/network/api.dart';

abstract class IMipRepository {
  IMipRepository();

  Future<List<Mip>> getAll();
  Future<Mip> getMip(int id);
  Future<String> createMip(PostMIPRequestModel postMIPRequestModel);
}

class MipRepository extends IMipRepository {
  MipRepository();

  @override
  Future<List<Mip>> getAll() async {
    final response = await Api().dio.get('/mips');
    List<dynamic> responseData = response.data["items"];
    List<Mip> mipList = responseData.map((json) => Mip.fromJson(json)).toList();
    return mipList;
  }

  @override
  Future<String> createMip(PostMIPRequestModel postMIPRequestModel) {
    var response = Api().dio.post("/mips", data: postMIPRequestModel.toJson());
    return response.then((value) => value.data.toString());
  }

  @override
  Future<Mip> getMip(int id) {
    var response = Api().dio.get("/mip/$id");
    return response.then((value) => Mip.fromJson(value.data));
  }
}
