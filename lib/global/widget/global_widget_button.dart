import 'package:flutter/material.dart';
import 'package:task_tracker_app/theme/color_theme.dart';

import '../../theme/font_theme.dart';

class GlobalWidgetButton extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;
  final bool? isExpanded;
  final Color? background;
  final void Function() onTap;
  const GlobalWidgetButton({super.key, required this.title, required this.onTap, this.padding, this.isExpanded, this.background});

  Widget body()=> Padding(
    padding: padding ?? EdgeInsets.zero,
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Card(
        color: background ?? ColorsTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 15
          ),
          width: double.infinity,
          child: Center(
            child: Text(
              title,
              style: FontThemes.bodyLarge(),
            )
          )
        )
      )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return (isExpanded == true)
      ? Expanded(
          child: body()
        )
      : body();
  }
}