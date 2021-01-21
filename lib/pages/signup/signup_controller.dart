/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 * All rights reserved.
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_app_template/const/const.dart';
import 'package:getx_app_template/services/services.dart';
import 'package:graphx/graphx.dart';

import '../../routes/routes.dart';
import 'signup_fields.dart';

class SignupController extends GetxController {
  final fields = SignupFields();
  // final api = ApiService.get();
  // final _mockUserDto = AuthRequestDto(
  //   email: 'roipeker@gmail.com',
  //   name: 'roi',
  //   surname: 'peker',
  //   password: '1234567',
  //   phone: '123123123',
  // );

  @override
  Future<void> onReady() async {
    super.onReady();
    Styles.statusIconsB();
    // fields.setDto(
    //   AuthRequestDto.fromAccountDto(
    //     api.user.me.dto,
    //   ),
    // );
    0.5.delay(fields.name.focus.requestFocus);
  }

  Future<void> onSend() async {
    if (!fields.validate()) return;
    // final dto = fields.signupDto;
    // final result = await api.auth.register(dto);
    // if (result.isError) {
    //   print('error token: ${result.data}// ${api.auth.token}');
    //   AppGetUtils.hidePreloader();
    //   return;
    // } else {
    //   print('OK >> token: ${result.data}// ${api.auth.token}');
    //
    //   /// all good... request data and move on!
    //   await api.user.account();
    //   AppGetUtils.hidePreloader();
    // }
    AppGetUtils.showPreloader();
    await 1.seconds.delay();
    AppGetUtils.hidePreloader();
    Get.offAllNamed(Routes.ROOT);
  }
}
