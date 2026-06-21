import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker_app/theme/color_theme.dart';
import 'package:task_tracker_app/theme/font_theme.dart';

import '../../controller/list/task_list_controller.dart';
import '../../model/single_task_model.dart';

class TaskListPage extends StatelessWidget {
  final TaskListController taskListController = Get.put(TaskListController());
  TaskListPage({super.key});

  AppBar appBar(){

    Widget icon()=> Padding(
      padding: EdgeInsets.only(
        right: 15
      ),
      child: GestureDetector(
        onTap: taskListController.logout,
        child: Icon(
          Icons.logout
        ),
      ),
    );
    return AppBar(
      title: Text("List Tugas"),
      backgroundColor: ColorsTheme.primary,
      actions: [
        icon(),
      ],
    );
  } 

  Widget buildCard({required SingleTaskModel model}){
    Widget buildName()=> Text(
      model.nama,
      style: FontThemes.bodyLarge(
        weight: FontWeight.bold
      ),
    );

    Widget buildTitleDescription({required String title, required String description}){

      return Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              title
            ),
          ),

          Text(
            ": "
          ),

          Text(
            description
          ),
        ],
      );
    }

    Widget buildTitle()=> buildTitleDescription(
      title: "Judul",
      description: model.title
    );

    Widget buildDescription()=> buildTitleDescription(
      title: "Deskripsi",
      description: model.description
    );

    Widget buildConstraint()=> buildTitleDescription(
      title: "Kendala",
      description: model.kendala
    );

    Widget buildStatus()=> buildTitleDescription(
      title: "Status",
      description: model.status
    );
    
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: (){
            taskListController.goToFromEdit(singleTaskModel: model);
          },
          child: Card(
            color: ColorsTheme.background,
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildName(),
                  Divider(),
                  buildTitle(),
                  buildDescription(),
                  buildConstraint(),
                  buildStatus(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildListView(){

    Widget buildLoading()=> Center(child: CircularProgressIndicator());

    Widget buildEmpty() => RefreshIndicator(
      onRefresh: taskListController.listTaskControllerApi.fetch,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            // physics ini wajib agar tetap bisa di-pull refresh meskipun kosong
            physics: const AlwaysScrollableScrollPhysics(), 
            child: Container(
              color: Colors.white,
              // Mengambil tinggi maksimal yang tersedia di layar secara otomatis
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: const Center(
                child: Text("Data Kosong"),
              ),
            ),
          );
        },
      ),
    );

    Widget buildError() => RefreshIndicator(
      onRefresh: taskListController.listTaskControllerApi.fetch,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            // physics ini wajib agar tetap bisa di-pull refresh meskipun kosong
            physics: const AlwaysScrollableScrollPhysics(), 
            child: Container(
              color: Colors.white,
              // Mengambil tinggi maksimal yang tersedia di layar secara otomatis
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Center(
                child: Text(
                  "${taskListController.listTaskControllerApi.message.value}, mohon refresh",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );

    Widget buildList()=> RefreshIndicator(
      color: ColorsTheme.primary,
      onRefresh: taskListController.listTaskControllerApi.fetch,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5
        ),
        itemCount: taskListController.listTaskControllerApi.model!.length,
        itemBuilder: (context, index) => buildCard(
          model: taskListController.listTaskControllerApi.model![index]
        )
      ),
    );
// taskListController
    return Obx(()=> (taskListController.listTaskControllerApi.isLoading.value == true)
      ? buildLoading()
      : (taskListController.listTaskControllerApi.statusCode.value == 200)
        ? (taskListController.listTaskControllerApi.model!.length.obs.value == 0)
          ? buildEmpty()
          : buildList()
        : buildError());

  }

  Widget body(){
    return buildListView();
  }

  Widget floatingActionButton(){

    return FloatingActionButton(
      backgroundColor: ColorsTheme.primary,
      onPressed: taskListController.goToFromCreate,
      child: Icon(
        Icons.add,
        color: ColorsTheme.white,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: floatingActionButton(),
    );
  }
}