import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/generated/i18n.dart';
import 'package:mall/custom/TitleBar.dart';
import 'package:mall/http/dio_utils.dart';
import 'package:mall/http/entity/user_entity.dart';
import 'package:mall/http/request_url.dart';
import 'package:mall/pages/home/home.dart';
import 'package:mall/utils/color_utils.dart';
import 'package:mall/utils/dimens_utils.dart';
import 'package:mall/utils/user_controller.dart';

class GoodsDetails extends StatelessWidget {
  final String mGoodsId;

  const GoodsDetails({Key key, @required this.mGoodsId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new TitleBar().backAppbar(context, "商品详情"),
        body: new Text("商品id===" + mGoodsId));
  }

//  void login() {
//    DioUtil().post(RequestUrl.LOGIN,
//        pathParams: null,
//        data: {'mobile': mMobileController.text, 'code': mCodeController.text},
//        errorCallback: (statusCode, msg) {
//          print(
//              'Http error code :' + statusCode.toString() + "===" + msg.toString());
//        }).then((data) {
//      if (data != null) {
//        UserEntity entity = UserEntity.fromJson(data);
//        UserController.mUserEntity = entity;
//        UserController.saveUserInfo(entity);
////      销毁当前页面
//        Navigator.pushAndRemoveUntil(context,
//            new MaterialPageRoute(builder: (context) {
//              return Home();
//            }), (route) => route == null);
//      }
//    });

//}

}
