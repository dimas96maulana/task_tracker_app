import '../../../../global/api/global_api.dart';

class DeleteTaskServiceApi{

  Future send({required String id}) {
    return checkConnectionDelete(
      direktori: "tugas/$id",
    );
  }
}