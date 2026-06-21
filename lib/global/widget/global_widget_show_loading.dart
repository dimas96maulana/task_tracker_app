import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';
import '../../theme/font_theme.dart' show FontThemes;

class GlobalWidgetShowLoading extends StatelessWidget {
  const GlobalWidgetShowLoading({super.key});

  Widget image()=> Padding(
    padding: EdgeInsets.only(
      bottom: 15
    ),
    child: Image.asset(
      "assets/logo2.png",
      height: 150,
    ),
  );

  Widget titleLoading()=> Text(
    "Loading ...",
    style: FontThemes.bodyLarge(
      weight: FontWeight.bold
    )
  );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                image(),
                titleLoading(),
              ],
            )
          ),
        ),
      ),
    );
  }
}