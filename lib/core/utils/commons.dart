import 'package:flutter/material.dart';


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
