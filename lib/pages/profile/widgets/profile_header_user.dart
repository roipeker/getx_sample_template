import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';

import '../profile_controller.dart';

class ProfileHeaderUserPane extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: NumUtils.rndColor(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Gap(16),
          Icon(
            Icons.person,
            size: 68,
            color: Styles.primaryColor,
          ),
          const Gap(28),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: GetBuilder(
                  init: controller,
                  id: 'user',
                  builder: (_) => Text(
                    controller.userTitle,
                    style: const TextStyle(
                      color: Styles.darkGrey,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                  ),
                ),
              ),
              Flexible(
                child: GetBuilder(
                  init: controller,
                  id: 'menu',
                  builder: (_) => Text(
                    controller.tabTitle,
                    style: const TextStyle(
                      color: Styles.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              FlatButton(
                  child: Icon(Icons.logout),
                  onPressed: controller.handleCloseSession),
            ],
          ),
        ],
      ),
    );
  }
}
