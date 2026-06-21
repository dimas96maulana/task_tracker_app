import 'package:get/get.dart';
import 'package:task_tracker_app/menu/login/page/login_page.dart';

import '../../../../global/storage/golabal_storage.dart';
import '../../../../global/widget/global_widget_alert.dart';
import '../../model/single_task_model.dart';
import '../../page/form/task_form_page.dart';
import '../api/list_task_controller_api.dart';

class TaskListController extends GetxController{
  final ListTaskControllerApi listTaskControllerApi = ListTaskControllerApi();
  SingleTaskModel? model;
  bool? isCreate;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData(){
    listTaskControllerApi.fetch();
  }

  void logout(){
    Get.dialog(
      GlobalWidgetAlert(
        description: "Apakah anda ingin logout ?",
        onTap: (){
          Storage.logout();
          Get.off(()=> LoginPage());
        }
      )
    );
  }

  void goToFromCreate(){
    isCreate = true;
    Get.to(()=> TaskForm())!.then((value) {
      if(value == true){
        initData();
      }
    },);
  }

  void goToFromEdit({required SingleTaskModel singleTaskModel}){
    model = singleTaskModel;

    isCreate = false;
    Get.to(()=> TaskForm())!.then(((value){
      if(value == true){
        initData();
      }
    }));
  }
}