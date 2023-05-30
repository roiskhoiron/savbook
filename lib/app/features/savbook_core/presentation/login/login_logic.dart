import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:savbook/app/features/savbook_core/application/login_app_service.dart';

import '../dashboard/dashboard_ui.dart';

class LoginLogic extends GetxController {
  final _app = Get.find<LoginAppService>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void onClose() {
    // TODO: implement onClose
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void requestLogin() {
    var result =
        _app.login(email: emailController.text, psw: passwordController.text);
    Get.toNamed(DashboardUi.routeName);
  }
}
