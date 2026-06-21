import '../../../../global/api/global_api.dart';

class DetailTaskServiceApi{

  Future fetch({required String id}) {
    return checkConnectionGet(
      direktori: "tugas/$id",
    );
  }
}