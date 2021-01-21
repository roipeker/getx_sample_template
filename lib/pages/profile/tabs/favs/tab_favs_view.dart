import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/widgets/widgets.dart';

import 'tab_favs_controller.dart';

class TabFavsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TabFavsController(),
      builder: (_) => _TabFavsView(),
    );
  }
}

class _TabFavsView extends GetView<TabFavsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        Expanded(
          child: Scrollbar(
            child: Obx(
              () {
                if (controller.isLoading) {
                  return Center(child: PreloaderCircular());
                }
                return Center(child: Text("FAVS!"));
              },
            ),
          ),
        )
      ],
    );
  }
}
