import '../core/network/api.dart';
import 'models/accreditation.dart';

abstract class IAccreditationRepository {
  IAccreditationRepository();

  Future<Accreditation> getEngineerAccreditation(int engineerId);
}

class AccreditationRepository extends IAccreditationRepository {
  AccreditationRepository();

  @override
  Future<Accreditation> getEngineerAccreditation(int engineerId) {
    var response = Api().dio.get("/accreditations?engineerId=$engineerId");
    return response.then((value) => Accreditation.fromJson(value.data));
  }
}
