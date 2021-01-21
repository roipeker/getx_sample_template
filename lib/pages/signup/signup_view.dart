import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:getx_app_template/pages/signup/signup_controller.dart';
import 'package:getx_app_template/services/services.dart';
import 'package:getx_app_template/widgets/widgets.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: 200, child: FlutterLogo()),
                GetInputText(config: controller.fields.name),
                GetInputText(config: controller.fields.lastname),
                GetInputText(config: controller.fields.email),
                GetInputText(config: controller.fields.phone),
                GetInputText(config: controller.fields.password),
                GetInputText(config: controller.fields.repeatPassword),
                const Gap(24),
                LineButton(
                  label: 'SIGNUP',
                  onTap: controller.onSend,
                ),
                Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
