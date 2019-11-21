import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mall/http/entity/user_entity.dart';
import 'package:mall/pages/home/home.dart';
import 'package:mall/pages/login/login.dart';
import 'package:mall/utils/user_controller.dart';

class WellCome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '欢迎',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Mall'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _loadLocalUserInfo();
  }

  _loadLocalUserInfo() {
    UserController.getUserEntity().then((UserEntity entity) {
      if (entity != null) {
        Navigator.pushAndRemoveUntil(context,
            new MaterialPageRoute(builder: (context) {
          return Home();
        }), (route) => route == null);
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new GestureDetector(
              child: new Text("欢迎下载使用\n\n提出您宝贵的意见\n\n代码还在完善阶段\n\n点击进入"),
              onTap: () {
//                Navigator.push(context, new MaterialPageRoute(builder: (context) =>new Login()));
//                销毁当前页面

                Navigator.pushAndRemoveUntil(context,
                    new MaterialPageRoute(builder: (context) {
                  return Login();
                }), (route) => route == null);
              },
            )
          ],
        ),
      ),
    );
  }
}
