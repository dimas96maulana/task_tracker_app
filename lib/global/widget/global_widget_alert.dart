import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker_app/global/widget/global_widget_button.dart';
import 'package:task_tracker_app/theme/font_theme.dart';

import '../../theme/color_theme.dart';

class GlobalWidgetAlert extends StatelessWidget {
  final String description;
  final void Function() onTap;
  const GlobalWidgetAlert({super.key, required this.description, required this.onTap});

  Widget buildTitle()=> Text(
    "Peringatan !",
    style: FontThemes.bodyLarge(
      weight: FontWeight.bold
    ),
  );

  Widget buildDescription()=> Padding(
    padding: EdgeInsets.only(
      bottom: 25
    ),
    child: Text(
      description,
      style: FontThemes.bodyMedium(),
    ),
  );

  Widget buildButtonCancel()=> GlobalWidgetButton(
    title: "Tidak", 
    isExpanded: true,
    background: ColorsTheme.white,
    onTap: (){
      Get.back();
    }
  );
  Widget buildButtonCan()=> GlobalWidgetButton(
    title: "Ya", 
    isExpanded: true,
    onTap: onTap
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: ColorsTheme.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildTitle(),
                Divider(),
                buildDescription(),
                Row(
                  children: [
                    buildButtonCancel(),
                    buildButtonCan(),
                  ],
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}