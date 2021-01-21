import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/widgets/widgets.dart';
import '../login_controller.dart';

class LoginPanel extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GetInputText(config: controller.email),
          const Gap(10),
          GetInputText(config: controller.password),
          const Gap(40),
          Obx(() => LineButton(
                label: 'Enter',
                onTap: controller.onLogin,
              )),
          Gap(26),
          TextButton(
            onPressed: controller.showForgotPass,
            child: Text('Forgot my pass'),
          ),
          TextButton(
            onPressed: controller.onSignup,
            child: Text('Create an account'),
          ),
        ],
      ),
    );
  }
}
