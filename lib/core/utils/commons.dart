import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';
import 'app_enums.dart';
  extension NavigateTo on BuildContext {
  void navigateTo({
    required String screenRoute,
    dynamic arg,
  }) {
    Navigator.pushNamed(this, screenRoute, arguments: arg);
  }
}

extension NavigateAndFinish on BuildContext {
  void navigateAndFinish({
    required String screenRoute,
    dynamic arg,
  }) {
    Navigator.pushReplacementNamed(this, screenRoute, arguments: arg);
  }
}
extension Pop on BuildContext {
  void pop() {
    Navigator.pop(this);
  }
}
extension ShowToastMsg on BuildContext {
  void showToastMsg({required String msg, required ToastStates toastState}) {
    Color color, textColor;
    switch (toastState) {
      case ToastStates.success:
        color = AppColors.orange;
        textColor = AppColors.white;
        break;
      case ToastStates.warning:
        color = AppColors.white;
        textColor = AppColors.softGrey;
        break;
      case ToastStates.error:
        color = Colors.red;
        textColor = AppColors.white;
        break;
    }
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: textColor,
      fontSize: 16.0,
    );
  }

}
