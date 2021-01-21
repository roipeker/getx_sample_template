import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/pages.dart';
import 'package:getx_app_template/services/services.dart';
import 'package:getx_app_template/services/session/models/user.dart';

import 'fields/password_fields.dart';
import 'fields/userinfo_fields.dart';

class TabUserSettingsController extends GetxController {
  UserInfoFields fields = UserInfoFields();
  PasswordFields passwordFields = PasswordFields();

  bool _isShowingUserInfo = true;

  bool get isShowingUserInfo => _isShowingUserInfo;

  bool _isEditUserInfo = false;

  bool get isEditUserInfo => _isEditUserInfo;

  String get labelEditUserInfo =>
      !_isEditUserInfo ? AppStrings.edit : AppStrings.cancel;

  UserModel get user => SessionService.user;
  // final api = ApiService.get();

  @override
  void onInit() {
    super.onInit();
    passwordFields.repeatNewPassword.obscureController =
        passwordFields.newPassword;
    fields.setModel(user);
    fields.enable(_isEditUserInfo);
  }

  Future<void> handleAcceptUserDataChange() async {
    if (!_isEditUserInfo) return;
    AppGetUtils.showPreloader();
    await 1.seconds.delay();
    // await api.user.update(fields.updateDto);
    AppGetUtils.hidePreloader();
    _isEditUserInfo = false;
    fields.setModel(user);
    fields.enable(_isEditUserInfo);
    AppGetUtils.unfocus();
    ProfileController.get().update(['user']);
    // Get.find<ProfileController>().update(['user']);
    update();
  }

  /// ---- USER INFO.
  void handleEditUserInfoTap() {
    _isEditUserInfo = !_isEditUserInfo;
    // update state of components.
    if (!_isEditUserInfo) {
      // CANCELLED, so return to previous state!
      fields.reset();
      passwordFields.clear();
    }
    fields.enable(_isEditUserInfo);
    if (_isEditUserInfo) {
      fields.name.focus.requestFocus();
    } else {
      AppGetUtils.unfocus();
    }
    update();
  }

  Future<void> handleAcceptPasswordChangeTap() async {
    AppGetUtils.unfocus();
    if (!passwordFields.validate()) return;
    AppGetUtils.showPreloader();
    await 1.seconds.delay();
    // final result = await api.auth.changePassword(passwordFields.passwordDto);
    AppGetUtils.hidePreloader();
    // if (result.data) {
//      .5.seconds.delay(handleCancelPasswordChangeTap);
    handleCancelPasswordChangeTap();
    // }
  }

  void handleCancelPasswordChangeTap() {
    _isShowingUserInfo = true;
    if (_isShowingUserInfo) {
      fields.email.enabled = false;
      passwordFields.obscure();
    }
    AppGetUtils.unfocus();
    update();
  }

  void handleChangePasswordTap() {
    _isShowingUserInfo = !_isShowingUserInfo;
    if (_isShowingUserInfo) {
      fields.email.enabled = false;
    }
    AppGetUtils.unfocus();
    update();
  }

  CrossFadeState get crossFadeState {
    return _isShowingUserInfo
        ? CrossFadeState.showFirst
        : CrossFadeState.showSecond;
  }

  @override
  void onClose() {
    print('close()');
  }

  void onSaveInfo() {}
}
