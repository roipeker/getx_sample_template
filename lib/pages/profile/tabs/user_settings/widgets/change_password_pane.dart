import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/profile/tabs/user_settings/user_settings_controller.dart';
import 'package:getx_app_template/widgets/widgets.dart';

class ChangePasswordPane extends GetView<TabUserSettingsController> {
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      fontSize: 17,
      letterSpacing: -.15,
      color: Styles.primaryColor,
      fontWeight: FontWeight.w500,
    );
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
//            const Gap(8),
            Text(AppStrings.changePassword, style: style),
            const Gap(8),
            GetInputText(config: controller.passwordFields.oldPassword),
            GetInputText(config: controller.passwordFields.newPassword),
            GetInputText(config: controller.passwordFields.repeatNewPassword),
            const Gap(24),
            Text(
              AppStrings.profileUserSettingsPasswordWarning,
              style: TextStyle(
                color: Styles.lightGrey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Gap(16),

            LineButton(
              label: AppStrings.cancel,
              onTap: controller.handleCancelPasswordChangeTap,
            ),
            const Gap(4),
            LineButton(
              label: AppStrings.accept,
              onTap: controller.handleAcceptPasswordChangeTap,
            ),
          ],
        ),
      ),
    );
  }
}
