import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global/storage/golabal_storage.dart';
import 'menu/login/page/login_page.dart';
import 'menu/task/page/list/task_list_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); 
  
  await Storage.getDataStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Task Tracker App',
      home: (Storage.isLogin == true)
        ? TaskListPage()
        : LoginPage(),
    );
  }
}