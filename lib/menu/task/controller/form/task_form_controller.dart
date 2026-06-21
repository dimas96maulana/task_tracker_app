import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker_app/global/widget/global_snackbar.dart';
import 'package:task_tracker_app/global/widget/global_widget_alert.dart';

import '../../../../global/model/check_send.dart';
import '../../model/single_task_model.dart';
import '../api/create_task_controller_api.dart';
import '../api/delete_task_controller_api.dart';
import '../api/update_task_controller_api.dart';
import '../list/task_list_controller.dart';

class TaskFormController extends GetxController{
  TaskListController taskListController = Get.find();

  final List<String> listKota = ["Done", "Pending"];
  RxString selectedValue = "".obs;

  final CreateTaskControllerApi createTaskControllerApi = CreateTaskControllerApi();
  final DeleteTaskControllerApi deleteTaskControllerApi = DeleteTaskControllerApi();
  final UpdateTaskControllerApi updateTaskControllerApi = UpdateTaskControllerApi();

  TextEditingController textEditName = TextEditingController();
  TextEditingController textEditTitle = TextEditingController();
  TextEditingController textEditDescription = TextEditingController();
  TextEditingController textEditConstraint = TextEditingController();

  List<CheckSend> initCheckSend(){

    return [
      CheckSend(
      name: "Field Nama", 
      data: textEditName.text, 
      checkEmpty: "", 
      message: "Field Nama harus di isi, digunakan untuk mengetahui tugas ini milik siapa"
    ),

    CheckSend(
      name: "Field Judul", 
      data: textEditTitle.text, 
      checkEmpty: "", 
      message: "Field Judul harus di isi"
    ),

    CheckSend(
      name: "Field Deskripsi", 
      data: textEditDescription.text, 
      checkEmpty: "", 
      message: "Mohon isi Deskripsi terleb ih dahulu"
    ),

    CheckSend(
      name: "Field Kendala", 
      data: textEditConstraint.text, 
      checkEmpty: "", 
      message: "Isi kendala anda pada Task ini"
    ),

    CheckSend(
      name: "Dropdown Status", 
      data: selectedValue, 
      checkEmpty: "", 
      message: "Status mohon pilih salah satu"
    ),
    ];
  }
  late List<CheckSend> checkSend = initCheckSend();
  
  SingleTaskModel? model;

  void initDataDetail(){
    model = taskListController.model;

    selectedValue.value = model!.status; 
    textEditName.text = model!.nama;
    textEditTitle.text = model!.title;
    textEditDescription.text = model!.description;
    textEditConstraint.text = model!.kendala;
  }

  @override
  void onInit() {
    if(taskListController.isCreate != true){
      initDataDetail();
    }
    super.onInit();
  }

  Future<bool> checkTextForm()async{
    checkSend = initCheckSend();
    for(int i=0 ; i<checkSend.length ; i++ ){
      if(checkSend[i].data == checkSend[i].checkEmpty){
        globalSnackbar(message: checkSend[i].message!,);
        return false;
      }
    }

    return true;
  }
  void save()async{
    bool isValid = await checkTextForm();

    if (!isValid) return;

    model = SingleTaskModel(
      nama: textEditName.text, 
      title: textEditTitle.text, 
      description: textEditDescription.text, 
      kendala: textEditConstraint.text, 
      status: selectedValue.value
    );

    await createTaskControllerApi.send(params: model!.toJson());
    if(createTaskControllerApi.statusCode.value == 201){
      Get.back(result: true);
    } else{
      globalSnackbar(
        message: "${createTaskControllerApi.message.value}, mohon coba lagi"
      );
    }
  }

  void delete(){
    Get.dialog(
      GlobalWidgetAlert(
        description: "Apakah Anda yakin untuk menghapus tugas ini ?", 
        onTap: ()async{
          Get.back();
          await deleteTaskControllerApi.send(id: taskListController.model!.id!);
          if(deleteTaskControllerApi.statusCode.value == 200 || deleteTaskControllerApi.statusCode.value == 201){
            Get.back(result: true);
          } else{
            globalSnackbar(
              message: "${createTaskControllerApi.message.value}, mohon coba lagi"
            );
          }
        }
      )
    );
  }

  void edit()async{
    bool isValid = await checkTextForm();

    if (!isValid) return;

    model = SingleTaskModel(
      nama: textEditName.text, 
      title: textEditTitle.text, 
      description: textEditDescription.text, 
      kendala: textEditConstraint.text, 
      status: selectedValue.value
    );

    await updateTaskControllerApi.send(
      id: taskListController.model!.id!,
      params: model!.toJson()
    );
    if(updateTaskControllerApi.statusCode.value == 200 || updateTaskControllerApi.statusCode.value == 201){
      Get.back(result: true);
    } else{
      globalSnackbar(
        message: "${createTaskControllerApi.message.value}, mohon coba lagi"
      );
    }
  }

}