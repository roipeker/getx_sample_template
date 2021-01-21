/*
 * Copyright (c) 2020. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'dart:collection';
import 'package:getx_app_template/routes/routes.dart';

import '../services.dart';
import 'models/user.dart';

class SessionService extends GetxService implements BaseService {
  static SessionService get() => Get.find();
  static UserModel user = UserModel.mockup();
  // static UserModel get user => ApiService.get().user.me;
  // static ApiService get api => ApiService.get();

  void logout() {
    FirebaseService.get().removeNotifications();
    // api.auth.clearToken();
    // api.user.me.reset();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  Future<void> init() async {}
}
