import 'package:flutter/material.dart';

class DeviceUrils {
  static double getDevicesWidth(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return width;
  }

  static double getDevicesHeight(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return height;
  }
}
