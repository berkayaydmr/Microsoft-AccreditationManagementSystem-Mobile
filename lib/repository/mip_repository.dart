import 'package:accreditation_management_system/repository/models/mip.dart';

import '../core/network/api.dart';

abstract class IMipRepository {
  IMipRepository();

  Future<List<Mip>> getAll();
}

class MipRepository extends IMipRepository {
  MipRepository();

  @override
  Future<List<Mip>> getAll() async {
    final response = await Api().dio.get('/mips');
    List<dynamic> responseData = response.data;
    List<Mip> mipList = responseData.map((json) => Mip.fromJson(json)).toList();
    return mipList;
  }
}