import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/http/entity/user_entity.dart';
import 'package:mall/utils/color_utils.dart';
import 'package:mall/utils/device.dart';
import 'package:mall/utils/user_controller.dart';

class HomeMine extends StatefulWidget {
  @override
  _ExampleTypeState createState() => _ExampleTypeState();
}

class _ExampleTypeState extends State<HomeMine>
    with AutomaticKeepAliveClientMixin {
  UserEntity mUserEntity;

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  bool check = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() {
    UserController.getUserEntity().then((UserEntity entity) {
      if (mounted) {
        setState(() {
          mUserEntity = entity;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: ColorUtils.ebebeb(),
      child: new Column(
        children: <Widget>[
          _buildTop(),
          _buildOrder(),
          _buildColumn(),
          _buildItem()
        ],
      ),
    );
  }

  _buildTop() {
    return new Container(
      color: ColorUtils.mainColor(),
      child: new Column(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.fromLTRB(0, 8, 0, 3),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Image.asset(
                    'assets/imgs/mine/mine_icon_msg.png',
                    width: 30,
                    height: 30,
                  ),
                  onTap: () {
                    Fluttertoast.showToast(msg: "暂未开发");
                  },
                ),
                new GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: new Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 15, 0),
                    child: Image.asset(
                      'assets/imgs/mine/mine_icon_set.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  onTap: () {
                    Fluttertoast.showToast(msg: "去设置页面");
                  },
                )
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.fromLTRB(16, 15, 0, 15),
            child: new Row(
              children: <Widget>[
                ClipOval(
                  child: Image.network(
                    mUserEntity == null ? "" : mUserEntity.avatar,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                ),
                new Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      mUserEntity == null
                          ? ""
                          : (mUserEntity.name + "--" + mUserEntity.mobile),
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildOrder() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
      child: new Column(
        children: <Widget>[
          new Container(
            height: 40,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("我的订单"),
                Text("全部订单"),
              ],
            ),
          ),
          new Container(
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: Column(
                    children: <Widget>[
                      new GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: new Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/imgs/mine/mine_icon_wait_pay.png",
                              width: 30,
                              height: 30,
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              "待支付",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.mainColor(),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Fluttertoast.showToast(msg: "待支付");
                        },
                      )
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Column(
                    children: <Widget>[
                      new GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: new Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/imgs/mine/mine_icon_wait_send_goods.png",
                              width: 30,
                              height: 30,
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              "待发货",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.mainColor(),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Fluttertoast.showToast(msg: "待发货");
                        },
                      )
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Column(
                    children: <Widget>[
                      new GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: new Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/imgs/mine/mine_icon_wait_receive_goods.png",
                              width: 30,
                              height: 30,
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              "待签收",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.mainColor(),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Fluttertoast.showToast(msg: "待签收");
                        },
                      )
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Column(
                    children: <Widget>[
                      new GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: new Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/imgs/mine/mine_icon_wait_comment.png",
                              width: 30,
                              height: 30,
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              "待评价",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.mainColor(),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Fluttertoast.showToast(msg: "待评价");
                        },
                      )
                    ],
                  ),
                  flex: 1,
                ),
                new Expanded(
                  child: Column(
                    children: <Widget>[
                      new GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: new Column(
                          children: <Widget>[
                            Image.asset(
                              "assets/imgs/mine/mine_icon_wait_refund.png",
                              width: 30,
                              height: 30,
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              "退换售后",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorUtils.mainColor(),
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          Fluttertoast.showToast(msg: "退换售后");
                        },
                      )
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildColumn() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: Column(
              children: <Widget>[
                new GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/imgs/mine/mine_icon_collection.png",
                        width: 25,
                        height: 25,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        "收藏",
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorUtils.mainColor(),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Fluttertoast.showToast(msg: "收藏");
                  },
                )
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: Column(
              children: <Widget>[
                new GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/imgs/mine/mine_icon_trace.png",
                        width: 25,
                        height: 25,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        "收藏",
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorUtils.mainColor(),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Fluttertoast.showToast(msg: "收藏");
                  },
                )
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: Column(
              children: <Widget>[
                new GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/imgs/mine/mine_icon_coupon.png",
                        width: 25,
                        height: 25,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        "优惠券",
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorUtils.mainColor(),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Fluttertoast.showToast(msg: "优惠券");
                  },
                )
              ],
            ),
            flex: 1,
          ),
          new Expanded(
            child: Column(
              children: <Widget>[
                new GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: new Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/imgs/mine/mine_icon_address.png",
                        width: 25,
                        height: 25,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        "地址管理",
                        style: TextStyle(
                          fontSize: 15,
                          color: ColorUtils.mainColor(),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Fluttertoast.showToast(msg: "地址管理");
                  },
                )
              ],
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  _buildItem() {
    return new Column(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: 10),
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: new Container(
                  width: DeviceUrils.getDevicesWidth(context),
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Image.asset(
                              "assets/imgs/mine/mine_icon_customer.png",
                              width: 25,
                              height: 25,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "客服",
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorUtils.mainColor(),
                              ),
                            )
                          ]),
                      Image.asset(
                        "assets/imgs/mine/mine_icon_item_go.png",
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: "客服");
                },
              ),
            ],
          ),
        ),
        new Container(
          margin: EdgeInsets.only(top: 10),
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: new Container(
                  width: DeviceUrils.getDevicesWidth(context),
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Image.asset(
                              "assets/imgs/mine/mine_icon_about.png",
                              width: 25,
                              height: 25,
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              "关于我们",
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorUtils.mainColor(),
                              ),
                            )
                          ]),
                      Image.asset(
                        "assets/imgs/mine/mine_icon_item_go.png",
                        width: 25,
                        height: 25,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: "关于我们");
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
