import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker_app/menu/login/controller/api/get_login_controller_api.dart';

import '../../../global/widget/global_snackbar.dart';
import '../../task/page/list/task_list_page.dart';

class LoginController extends GetxController{
  GetLoginControllerApi getLoginControllerApi = GetLoginControllerApi();

  TextEditingController textfieldUsername = TextEditingController();
  TextEditingController textfieldPassword = TextEditingController();

  @override
  void onInit() {
    // getLoginControllerApi.send();
    initData();
    super.onInit();
  }

  void initData(){
    textfieldUsername.text = "dimas";
    textfieldPassword.text = "dimas";
  }

  void login()async{
    if(textfieldUsername.text == "dimas" && textfieldPassword.text == "dimas"){

      await getLoginControllerApi.send();
      if(getLoginControllerApi.statusCode.value == 200){
        Get.off(()=>TaskListPage());
      } else{
        globalSnackbar(
          message: getLoginControllerApi.message.value,
        );
      }
    } else{
      globalSnackbar(
        message: "username dan password anda tidak sesuai",
      );
    }
  }

}