import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/profile/tabs/user_settings/user_settings_controller.dart';
import 'package:getx_app_template/widgets/widgets.dart';

class UserInfoPane extends GetView<TabUserSettingsController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Scrollbar(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            GetInputText(config: controller.fields.email),
            GetInputText(config: controller.fields.name),
            GetInputText(config: controller.fields.lastname),
            GetInputText(config: controller.fields.phone),
            Gap(8),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: controller.isEditUserInfo,
              child: PasswordButton(onTap: controller.handleChangePasswordTap),
            ),
            Gap(8),
            LineButton(
              label: controller.labelEditUserInfo,
              onTap: controller.handleEditUserInfoTap,
            ),
            if (controller.isEditUserInfo)
              LineButton(
                label: AppStrings.accept,
                onTap: controller.handleAcceptUserDataChange,
              ),
            Gap(24),
          ],
        ),
      ),
    );
  }
}
