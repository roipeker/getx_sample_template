/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 */

import 'dart:async';
import 'package:get/get.dart';
import 'package:getx_app_template/routes/routes.dart';

class TabStatsController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading();
  final dataProvider = [];

  @override
  void onInit() {
    super.onInit();
    _loadList();
  }

  Future<void> _loadList() async {
    _isLoading(true);
    dataProvider.clear();
    await 1.seconds.delay();
    // final response = await api.order.myPurchases();
    // if (!response.isError && response.data != null) {
    //   dataProvider.addAll(response.data.map((e) => CompraVo.fromDto(e)));
    // }
    _isLoading(false);
  }

  Future<void> handleItemTap(int idx) async {
    final model = dataProvider[idx];
    await Get.toNamed(
      Routes.ORDER_DETAILS,
      arguments: [model.id, false],
    );
    _loadList();
  }
}
