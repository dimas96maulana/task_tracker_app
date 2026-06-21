import '../../../../global/api/global_api.dart';

class GetLoginServiceApi{

  Future send() {
    return checkConnectionGet(
      direktori: "login",
      baseUrl: "https://6a367103766b831960f93d61.mockapi.io/"
    );
  }
}