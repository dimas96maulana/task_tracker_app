import 'package:get/get.dart';

import '../../theme/color_theme.dart';

void globalSnackbar({required String message}){
  Get.snackbar(
    "Warning", 
    message,
    snackPosition: SnackPosition.BOTTOM,
    // ignore: deprecated_member_use
    backgroundColor: ColorsTheme.red.withOpacity(0.7)
  );
}