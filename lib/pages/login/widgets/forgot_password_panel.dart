import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/widgets/widgets.dart';
import '../login_controller.dart';

class ForgotPasswordPanel extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Gap(48),
          GetInputText(config: controller.email),
          const Gap(12),
          LineButton(
            label: 'SEND NEW PASS',
            onTap: controller.onForgotPasswordSend,
          ),
          const Gap(12),
          TextButton(
            onPressed: controller.showLogin,
            child: Text('GO BACK'),
          ),
          const Gap(24),
          Text(
            'We will send you an email so you can recover your password.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Styles.lightGrey),
          ),
          const Gap(24),
        ],
      ),
    );
  }
}
