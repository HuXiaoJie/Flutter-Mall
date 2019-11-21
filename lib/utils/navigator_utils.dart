import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mall/pages/goods/goods_details.dart';

class NavigatorUtils {
  static goGoodsDetails(BuildContext context, String goodsId) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new GoodsDetails(
                  mGoodsId: goodsId,
                )));
  }
}
