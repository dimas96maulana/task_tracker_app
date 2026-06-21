import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../global/api/global_api.dart';
// import 'package:http/http.dart' as http;

import '../../../../global/widget/global_widget_show_loading.dart';
import '../../service/api/delete_task_service_api.dart';

class DeleteTaskControllerApi implements VariabelController{
  final DeleteTaskServiceApi deleteTaskServiceApi = DeleteTaskServiceApi();

  @override
  RxBool isLoading = InitVariabelController().isLoading.obs;
  @override
  RxString message = InitVariabelController().message.obs;
  @override
  dynamic result = InitVariabelController().result;
  @override
  RxInt statusCode = InitVariabelController().statusCode.obs;
  @override
  void refreshVariabel() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      isLoading.value = InitVariabelController().isLoading;
      message.value = InitVariabelController().message;
      statusCode.value = InitVariabelController().statusCode;
      result = InitVariabelController().result;
      Get.dialog(
        GlobalWidgetShowLoading()
      );
    });
  }

  Future send({required String id}) async {
    refreshVariabel();
    
    result = await deleteTaskServiceApi.send(
      id: id
    );

    await checkController(
      result: result,
      error: (message, isLoading, statusCode) {
        Get.back();
        this.message.value = message;
        this.isLoading.value = isLoading;
        this.statusCode.value = statusCode;

      },
      success: (message, isLoading, statusCode) async {
        Get.back();
        this.message.value = message;
        this.isLoading.value = isLoading;
        this.statusCode.value = statusCode;


        // http.Response response = result;
      },
    );
  }

}