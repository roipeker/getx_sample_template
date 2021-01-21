import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/widgets/widgets.dart';
import '../profile_controller.dart';

class ProfileHeaderMenu extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: GetBuilder(
        init: controller,
        id: 'menu',
        builder: (_) {
          final dataProvider = controller.menuData;
          final items =
              controller.menuData.asMap().keys.map<AppIconButton>((idx) {
            final selected = idx == controller.selectedTabIndex;
            return AppIconButton(
              iconData: dataProvider[idx].ico,
              selected: selected,
              onTap: () => controller.onTabTap(idx),
            );
          }).toList();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: items,
          );
        },
      ),
    );
  }
}
