import '../../../../global/api/global_api.dart';

class UpdateTaskServiceApi{

  Future send({required String id, required Map<String, dynamic> params}) {
    return checkConnectionPut(
      direktori: "tugas/$id",
      params: params
    );
  }
}