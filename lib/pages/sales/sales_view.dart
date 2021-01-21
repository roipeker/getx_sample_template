import 'package:flutter/material.dart';
import 'package:getx_app_template/services/services.dart';
import 'sales_controller.dart';

class SalesView extends GetView<SalesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'SALES',
          style: TextStyle(fontSize: 90),
        ),
      ),
    );
  }
}
