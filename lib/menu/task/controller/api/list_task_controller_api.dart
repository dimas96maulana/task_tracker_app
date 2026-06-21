import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../global/api/global_api.dart';
import 'package:http/http.dart' as http;

import '../../../../global/widget/global_widget_show_loading.dart';
import '../../model/single_task_model.dart';
import '../../service/api/list_task_service_api.dart';

class ListTaskControllerApi implements VariabelController{
  final ListTaskServiceApi listTaskServiceApi = ListTaskServiceApi();
  List<SingleTaskModel>? model;

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
      model = null;
      Get.dialog(
        GlobalWidgetShowLoading()
      );
    });
  }

  Future fetch() async {
    refreshVariabel();
    
    result = await listTaskServiceApi.fetch();

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

        model = List<SingleTaskModel>.from(
          jsonDecode(response.body).map((x) => SingleTaskModel.fromJson(x))
        );
        // singleGetLoginModel = SingleGetLoginModel.fromJson(jsonDecode(response.body)[0]);

      },
    );
  }

}