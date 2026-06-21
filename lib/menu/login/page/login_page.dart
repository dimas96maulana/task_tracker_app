import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker_app/theme/color_theme.dart';

import '../../../global/widget/global_widget_button.dart';
import '../../../global/widget/global_widget_textfield.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController loginController = Get.put(LoginController());

  Widget body(){
    
    Widget image()=> Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30
      ),
      child: Image.asset(
        "assets/logo.jpeg",
      ),
    );

    Widget fieldUsername()=> GlobalWidgetTextfield(
      title: "Username", 
      padding: EdgeInsets.only(
        top: 50,
        left: 30,
        right: 30
      ),
      controller: loginController.textfieldUsername
    );
    Widget fieldPassword()=> GlobalWidgetTextfield(
      title: "Password", 
      padding: EdgeInsets.only(
        top: 10,
        left: 30,
        right: 30,
        bottom: 60
      ),
      controller: loginController.textfieldPassword,
      isPassword: true,
    );

    Widget fieldButton()=> GlobalWidgetButton(
      title: "Login",
      padding: EdgeInsets.symmetric(
        horizontal: 30
      ),
      onTap: loginController.login
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        image(),
        fieldUsername(),
        fieldPassword(),
        fieldButton(),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.white,
      body: body()
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: InkWell(
      //         onTap: (){
      //           loginController.getLoginControllerApi.send();
      //           print("cek cek data data 123");    
      //         },
      //         child: Text("data 12"),
      //       ),
      //     ),
      //     SizedBox(height: 30,),
      //     Center(
      //       child: InkWell(
      //         onTap: (){
      //           print("cek cek data data 2: ${Storage.singleGetLoginModel!.username}");    
      //         },
      //         child: Text("data 123"),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}