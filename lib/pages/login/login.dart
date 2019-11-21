import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/generated/i18n.dart';
import 'package:mall/custom/TitleBar.dart';
import 'package:mall/http/dio_utils.dart';
import 'package:mall/http/entity/user_entity.dart';
import 'package:mall/http/request_url.dart';
import 'package:mall/pages/home/home.dart';
import 'package:mall/utils/color_utils.dart';
import 'package:mall/utils/dimens_utils.dart';
import 'package:mall/utils/user_controller.dart';

class Login extends StatefulWidget {
  @override
  _Example4State createState() => _Example4State();
}

class _Example4State extends State<Login> with TickerProviderStateMixin {
  TextEditingController mMobileController = TextEditingController();
  TextEditingController mCodeController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new TitleBar().noBackAppbar(context, "登录"),
        body: new Form(
          child: new Container(
              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      //文字样式设置

                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          decoration: TextDecoration.none),
//                设置边框属性
//                默认的有底部下划线的
                      decoration: InputDecoration(
                        //输入前的提示文字
                        hintText: "请输入手机号",
                        labelText: "默认账户：18612187425",
                        //去掉下划线
                        border: InputBorder.none,
                        //输入前的提示文字样式
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly, //只输入数字
                        LengthLimitingTextInputFormatter(11) //限制长度
                      ],
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.number,
                      controller: mMobileController,
                    ),
                    new Container(
                      child: new Divider(
                        height: DimensUtils.MAIN_LINE_HEIGHT,
                        color: ColorUtils.mainLineColor(),
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Expanded(
                              flex: 3,
                              child: TextFormField(

                                  //文字样式设置
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      decoration: TextDecoration.none),
                                  //设置边框属性
                                  //默认的有底部下划线的
                                  decoration: InputDecoration(
                                    //输入前的提示文字
                                    hintText: "请输入验证码",
                                    labelText: "默认验证码：1111",
                                    //去掉下划线
                                    border: InputBorder.none,
                                    //输入前的提示文字样式
                                    hintStyle: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey),
                                  ),
                                  inputFormatters: <TextInputFormatter>[
                                    WhitelistingTextInputFormatter.digitsOnly,
                                    //只输入数字
                                    LengthLimitingTextInputFormatter(4)

                                    //限制长度
                                  ],
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.left,
                                  controller: mCodeController)),
                          new Expanded(
                            child: new Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                decoration: new BoxDecoration(
                                    color: ColorUtils.mainButtonColor(),
                                    borderRadius: new BorderRadius.all(
                                        Radius.circular(8))),
                                child: Text(
                                  "获取验证码",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    new Container(
                      child: new Divider(
                        height: DimensUtils.MAIN_LINE_HEIGHT,
                        color: ColorUtils.mainLineColor(),
                      ),
                    ),
                    new GestureDetector(
                      child: new Container(
                          height: 45,
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          decoration: new BoxDecoration(
                              color: ColorUtils.mainButtonColor(),
                              borderRadius:
                                  new BorderRadius.all(Radius.circular(25))),
                          child: Text(
                            "登录",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      onTap: () {
                        login();
                      },
                    ),
                  ],
                ),
              )),
        ));
  }

  void login() {
    DioUtil().post(RequestUrl.LOGIN,
        pathParams: null,
        data: {'mobile': mMobileController.text, 'code': mCodeController.text},
        errorCallback: (statusCode, msg) {
      Fluttertoast.showToast(msg: msg);
      print(
          'Http error code :' + statusCode.toString() + "===" + msg.toString());
    }).then((data) {
      if (data != null) {
        UserEntity entity = UserEntity.fromJson(data);
        UserController.mUserEntity = entity;
        UserController.saveUserInfo(entity);
//      销毁当前页面
        Navigator.pushAndRemoveUntil(context,
            new MaterialPageRoute(builder: (context) {
          return Home();
        }), (route) => route == null);
      }
    });
  }
}
