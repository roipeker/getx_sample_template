import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/pages/login/login_controller.dart';
import 'package:graphx/graphx.dart';

import 'widgets/forgot_password_panel.dart';
import 'widgets/login_panel.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(width: 200, child: FlutterLogo()),
                Obx(() {
                  trace("forgot: ", controller.isForgotPassword,
                      controller.crossFadeState);
                  return AnimatedCrossFade(
                    duration: .35.seconds,
                    reverseDuration: .2.seconds,
                    firstCurve: Curves.easeOutExpo,
                    secondCurve: Curves.easeOutExpo,
                    sizeCurve: Curves.decelerate,
                    firstChild: _addPanel(
                      LoginPanel(),
                      controller.isForgotPassword,
                    ),
                    secondChild: _addPanel(
                      ForgotPasswordPanel(),
                      !controller.isForgotPassword,
                    ),
                    crossFadeState: controller.crossFadeState,
                  );
                }),
                Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // controller.isForgotPassword
  Widget _addPanel(Widget panel, bool ignore) {
    return IgnorePointer(
      ignoring: ignore,
      ignoringSemantics: ignore,
      child: panel,
    );
  }
}
