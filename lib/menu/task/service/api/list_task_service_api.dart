import '../../../../global/api/global_api.dart';

class ListTaskServiceApi{

  Future fetch() {
    return checkConnectionGet(
      direktori: "tugas",
    );
  }
}