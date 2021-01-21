import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/pages.dart';

import '../widgets.dart';

class CloseSessionDialog extends GetView<ProfileController> {
  CloseSessionDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Styles.primaryColor, width: 1)),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 40,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            AppStrings.closeSessionDialogTitle,
            style: Get.textTheme.headline5,
          ),
          const Gap(10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person, color: Styles.primaryColor),
              const Gap(8),
              Text(
                controller.user.fullnameUI,
                style: Styles.membresiaItemTitleTextStyle
                    .copyWith(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const Gap(24),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LineButton(
                width: 90,
                label: AppStrings.dialogYes,
                onTap: () => Get.back(result: true),
              ),
              const Gap(32),
              LineButton(
                width: 90,
                label: AppStrings.dialogNo,
                onTap: () => Get.back(result: false),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
