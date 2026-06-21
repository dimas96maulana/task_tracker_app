import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker_app/global/widget/global_widget_button.dart';
import 'package:task_tracker_app/global/widget/global_widget_textfield.dart';
import 'package:task_tracker_app/theme/font_theme.dart';

import '../../../../theme/color_theme.dart';
import '../../controller/form/task_form_controller.dart';
import '../../controller/list/task_list_controller.dart';

class TaskForm extends StatelessWidget {
  final TaskListController taskListController = Get.find();
  final TaskFormController taskFormController = Get.put(TaskFormController());
  TaskForm({super.key});

  AppBar appBar()=> AppBar(
    title: Text("${(taskListController.isCreate == true) ? "Create": "Edit"} Tugas"),
    backgroundColor: ColorsTheme.primary,
  );
  
  Widget body(){

    Widget buildFormName()=> GlobalWidgetTextfield(
      title: "Name", 
      controller: taskFormController.textEditName,
      padding: EdgeInsets.only(
        bottom: 10
      ),
    );

    Widget buildTitle()=> GlobalWidgetTextfield(
      title: "Judul", 
      controller: taskFormController.textEditTitle,
      padding: EdgeInsets.only(
        bottom: 10
      ),
    );

    Widget buildDescription()=> GlobalWidgetTextfield(
      title: "Deskripsi", 
      controller: taskFormController.textEditDescription,
      padding: EdgeInsets.only(
        bottom: 10
      ),
    );

    Widget buildConstraint()=> GlobalWidgetTextfield(
      title: "Kendala", 
      controller: taskFormController.textEditConstraint,
      padding: EdgeInsets.only(
        bottom: 10
      ),
    );

    Widget buildDropDown(){

      Widget buildTitle()=> Text(
        "Status",
        style: FontThemes.titleSmall(),
      );

      Widget customDropDown()=> Obx(()=> Container(
        margin: EdgeInsets.only(
          top: 10
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsTheme.primary,
        ),
        child: DropdownButton<String>(
          value: (taskFormController.selectedValue.value == "")
            ? null
            : taskFormController.selectedValue.value,
          dropdownColor: ColorsTheme.primary,
          hint: Text(
            "Mohon Pilih salah satu",
            style: FontThemes.bodyLarge(
              color: ColorsTheme.textPrimary
            ),
          ), 
          isExpanded: true, 
          style: FontThemes.bodySmall(
            color: ColorsTheme.textPrimary
          ),
          items: taskFormController.listKota.map((String kota)=> DropdownMenuItem<String>(
            value: kota, 
            child: Text(kota), 
          )).toList(),
          onChanged: (String? newValue) {
              taskFormController.selectedValue.value = newValue!; 
          },
        ),
      ));

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          customDropDown()
        ],
      );
    } 

    Widget buildButton(){
      Widget buildCreate()=> GlobalWidgetButton(
        title: "Simpan", 
        onTap: taskFormController.save
      );

      Widget buildDetail(){
        Widget buildDelete()=> GlobalWidgetButton(
          title: "Hapus", 
          isExpanded: true,
          background: ColorsTheme.white,
          onTap: taskFormController.delete
        );
        Widget buildEdit()=> GlobalWidgetButton(
          title: "Edit", 
          isExpanded: true,
          onTap: taskFormController.edit
        );
        return Row(
          children: [
            buildDelete(),
            buildEdit(),
          ],
        );
      }

      return (taskListController.isCreate == true)
        ? buildCreate()
        : buildDetail();
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10
      ),
      child: Column(
        children: [
          buildFormName(),
          buildTitle(),
          buildDescription(),
          buildConstraint(),
          buildDropDown(),
          Expanded(child: SizedBox()),
          buildButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: appBar(),
        body: body()
      ),
    );
  }
}