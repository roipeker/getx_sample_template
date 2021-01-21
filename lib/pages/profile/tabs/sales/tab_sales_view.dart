import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/pages/profile/tabs/sales/tab_sales_controller.dart';
import 'package:getx_app_template/widgets/widgets.dart';

class TabSalesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TabSalesController(),
      builder: (_) => _TabSalesView(),
    );
  }
}

class _TabSalesView extends GetView<TabSalesController> {
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
                return Center(child: Text("SALES"));
              },
            ),
          ),
        )
      ],
    );
  }
}
