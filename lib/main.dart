import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mall/pages/wellcome/wellcome.dart';

void main() {
  runApp(WellCome());

  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark
        //单个页面设置在return Scaffold(之前
        // 设置该方法SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        //
        );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

