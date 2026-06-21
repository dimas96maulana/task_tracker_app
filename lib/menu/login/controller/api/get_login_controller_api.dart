import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../global/api/global_api.dart';
import '../../../../global/storage/golabal_storage.dart';
import '../../../../global/widget/global_widget_show_loading.dart';
import '../../model/single_get_login_model.dart';
import '../../service/api/get_login_service_api.dart';
import 'package:http/http.dart' as http;

class GetLoginControllerApi implements VariabelController{
  final GetLoginServiceApi getLoginServiceApi = GetLoginServiceApi();
  SingleGetLoginModel? singleGetLoginModel;

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
      singleGetLoginModel = null;
      Get.dialog(
        GlobalWidgetShowLoading()
      );
    });
  }

  Future send() async {
    refreshVariabel();
    
    result = await getLoginServiceApi.send();

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

        http.Response response = result;
        // singleGetLoginModel = SingleGetLoginModel.fromJson(jsonDecode(response.body)[0]);
        
        await Storage.setDataStorage(
          isLogin: true, 
          modelEncode: jsonEncode(jsonDecode(response.body)[0])
        );

      },
    );
  }

}