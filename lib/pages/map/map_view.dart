import 'package:flutter/material.dart';
import 'package:getx_app_template/services/services.dart';

import 'map_controller.dart';

class MapView extends GetView<MapController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'MAP',
          style: TextStyle(fontSize: 90),
        ),
      ),
    );
  }
}
