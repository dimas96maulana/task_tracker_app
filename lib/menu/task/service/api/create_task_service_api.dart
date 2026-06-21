import '../../../../global/api/global_api.dart';

class CreateTaskServiceApi{

  Future send({required Map<String, dynamic> params}) {
    return checkConnectionPost(
      direktori: "tugas",
      params: params,
    );
  }
}