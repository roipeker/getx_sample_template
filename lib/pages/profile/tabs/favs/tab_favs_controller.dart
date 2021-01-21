/*
 * Copyright (c) 2021. roipeker™ [Rodrigo López Peker]
 */

import 'dart:async';
import 'package:get/get.dart';

class TabFavsController extends GetxController {
  final _isLoading = false.obs;
  bool get isLoading => _isLoading();

  @override
  void onInit() {
    super.onInit();
    _loadList();
  }

  Future<void> _loadList() async {
    _isLoading(true);
    await 1.seconds.delay();
    _isLoading(false);
  }
}
