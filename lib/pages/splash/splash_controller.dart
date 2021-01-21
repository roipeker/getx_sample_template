/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'package:get/get.dart';
import 'package:getx_app_template/services/services.dart';
import 'package:graphx/graphx.dart';

import '../../routes/routes.dart';

class SplashController extends GetxController {
  SessionService get session => SessionService.get();
  // ApiService get api => ApiService.get();

  @override
  void onReady() {
    super.onReady();
    _initState();
  }

  Future<void> _initState() async {
    await 1.delay();
    // final hasToken = api.auth.hasToken;
    // final user = SessionService.user;
    bool hasToken = false;
    if (!hasToken) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.ROOT);
    }
  }
}
