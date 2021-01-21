import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/widgets/no_content.dart';
import 'package:getx_app_template/widgets/widgets.dart';

import 'tab_stats_controller.dart';

class TabStatsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TabStatsController(),
      builder: (_) => _TabStatsView(),
    );
  }
}

class _TabStatsView extends GetView<TabStatsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(8),
        const Gap(8),
        Expanded(
          child: Scrollbar(
            child: Obx(
              () {
                if (controller.isLoading) {
                  return Center(child: PreloaderCircular());
                }
                final dataProvider = controller.dataProvider;
                if (dataProvider.isEmpty) {
                  return NoContent(message: 'No stats');
                }
                return Container();
              },
            ),
          ),
        )
      ],
    );
  }
}
