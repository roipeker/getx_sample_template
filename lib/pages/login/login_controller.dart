/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/routes/routes.dart';
import 'package:getx_app_template/services/services.dart';
import 'package:getx_app_template/widgets/widgets.dart';
import 'package:graphx/graphx.dart';

import 'login_fields.dart';

class LoginController extends GetxController {
  final _isForgotPass = false.obs;
  final _isValidForm = false.obs;
  final _fields = LoginFields();
  var _isProcessing = false;

  bool get isForgotPassword => _isForgotPass();
  CrossFadeState get crossFadeState {
    return isForgotPassword
        ? CrossFadeState.showSecond
        : CrossFadeState.showFirst;
  }

  @override
  void onInit() {
    super.onInit();
    _fields.allFields.forEach((input) {
      input.onChanged = (val) {
        _isValidForm.value = GetInputTextConfig.validateAll(_fields.allFields);
      };
    });
  }

  @override
  void onReady() {
    super.onReady();
    0.5.delay(email.focus.requestFocus);
  }

  void showLogin() {
    _isForgotPass(false);
  }

  void showForgotPass() {
    _isForgotPass(true);
  }

  VoidCallback get onLogin => _isValidForm() ? _onLogin : null;
  GetInputTextConfig get email => _fields.email;
  GetInputTextConfig get password => _fields.password;

  void onSignup() {
    Get.toNamed(Routes.SIGNUP);
  }

  bool _canSendForgotPasswordSend() {
    if (!email.validate()) return false;
    if (_isProcessing) return false;
    return true;
  }

  Future<void> onForgotPasswordSend() async {
    if (!_canSendForgotPasswordSend()) {
      return;
    }
    _isProcessing = true;
    AppGetUtils.showPreloader();
//     final dto = fields.forgotPassDto;
//     final result = await api.auth.forgotPassword(dto);
    await 1.seconds.delay();
    AppGetUtils.hidePreloader();
    _isProcessing = false;
    final isOK = Math.randomBool();
    if (isOK) {
      AppGetUtils.showSuccess('Password mail sent', title: "Done!");
      await 1.delay();
      showLogin();
    } else {
      AppGetUtils.showError('Sorry, something went wrong.', title: "ouch!");
    }
  }

  Future<void> _onLogin() async {
    AppGetUtils.showPreloader();
    // final dto = AuthRequestDto(
    //   email: email.value.trim(),
    //   password: password.value,
    // );
    /// errors are managed by the AuthService, showing a snackbar.
    // final result = await api.auth.login(dto);
    // if (!result.data) {
    //   AppGetUtils.hidePreloader();
    //   return;
    // }
    /// retrieve account data.
//     await api.user.account();
    await 1.seconds.delay();
    AppGetUtils.hidePreloader();
    Get.offAllNamed(Routes.ROOT);
  }
}
