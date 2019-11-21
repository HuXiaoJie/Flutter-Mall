import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/custom/TitleBar.dart';
import 'package:mall/http/dio_utils.dart';
import 'package:mall/http/entity/home_shop_bar_entity.dart';
import 'package:mall/http/request_url.dart';
import 'package:mall/utils/color_utils.dart';
import 'package:mall/utils/device.dart';
import 'package:mall/utils/navigator_utils.dart';
import 'package:mall/utils/user_controller.dart';

class HomeShopBar extends StatefulWidget {
  @override
  _ExampleTypeState createState() => _ExampleTypeState();
}

class _ExampleTypeState extends State<HomeShopBar>
    with AutomaticKeepAliveClientMixin {
  ScrollController _scrollController = ScrollController();
  List<HomeShopBarEntity> mData = new List<HomeShopBarEntity>();
  int page = 1;
  bool isMore = true;
  bool isLoading = false;
  bool isSelectAll = false;

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('滑动到了最底部');
        if (isMore) {
          _onLoadMore();
        } else {
          isMore = false;
//          Fluttertoast.showToast(msg: "没有更多");
        }
      }
    });
    _onRefresh();
  }

  _loadData() {
    DioUtil().post(RequestUrl.HOM_SHOPPONG_CAR,
        pathParams: null, data: {"uid": UserController.getUserUID()},
        errorCallback: (statusCode, msg) {
      print('Http error code : $statusCode');
    }).then((data) {
      if (data != null) {
        (data as List).forEach((item) {
          HomeShopBarEntity entity = HomeShopBarEntity.fromJson(item);
          if (mounted) {
            setState(() {
              mData.add(entity);
            });
          }
          Future.delayed(Duration(seconds: 3), () {
            setState(() {
              isMore = ((data as List).length < 20) ? false : true;
            });
          });
        });
      }
    });
  }

  Future<Null> _onRefresh() async {
    mData.clear();
    page = 1;
    _loadData();
  }

  Future<Null> _onLoadMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
    }
    page = page + 1;
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new TitleBar().noBackHomeAppbar(context, "购物车"),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Expanded(
              child: new RefreshIndicator(
            onRefresh: _onRefresh,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return _itemBuildView(context, index);
              },
              itemCount: mData.length,
              controller: _scrollController,
              physics: new AlwaysScrollableScrollPhysics(),
            ),
          )),
          _buildButtonView()
        ],
      ),
    );
  }

  _buildButtonView() {
    return new Container(
      height: 50,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: new Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
                  child: (isSelectAll
                      ? Image.asset("assets/imgs/shopbar/check_select.png",
                          width: 25, height: 25)
                      : Image.asset("assets/imgs/shopbar/check_unselect.png",
                          width: 25, height: 25)),
                ),
                Text("全选")
              ],
            ),
            onTap: () {
              if (mounted) {
                setState(() {
                  isSelectAll = !isSelectAll;
                  if (mData != null) {
                    mData.forEach((item) {
                      item.select = isSelectAll;
                    });
                  }
                });
              }
            },
          ),
          new Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: new Row(
              children: <Widget>[
                Text(_totalPrice(), style: TextStyle(color: Colors.red)),
                new GestureDetector(
                  child: new Container(
                    margin: EdgeInsets.only(left: 10),
                    alignment: Alignment.center,
                    width: 80,
                    height: 50,
                    color: Colors.red,
                    child: Text(
                      "去结算",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Fluttertoast.showToast(msg: "去结算");
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _totalPrice() {
    String result = "合计：";
    double resultTotalPrice = 0.0000;
    String resultTotalPriceStr = "";
    if (mData != null) {
      mData.forEach((item) {
        if (item.select) {
          resultTotalPrice = resultTotalPrice + (item.price * item.selectCount);
          var temp = resultTotalPrice.toStringAsFixed(3);
          resultTotalPriceStr = temp.substring(0, temp.lastIndexOf('.') + 3);
        }
      });
    }
    return result + resultTotalPriceStr;
  }

  Widget _itemBuildView(BuildContext context, int index) {
    return new GestureDetector(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
          child: new Row(
            children: <Widget>[
              new GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: (mData[index].select
                    ? Image.asset("assets/imgs/shopbar/check_select.png",
                        width: 25, height: 25)
                    : Image.asset("assets/imgs/shopbar/check_unselect.png",
                        width: 25, height: 25)),
                onTap: () {
                  if (mounted) {
                    setState(() {
                      mData[index].select = !mData[index].select;
                    });
                    _totalPrice();
                  }
                },
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: new Row(
                  children: <Widget>[
                    Image.network(
                      mData[index].pic,
                      width: 90,
                      height: 90,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 45,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            mData[index].name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          height: 45,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "¥" + mData[index].price.toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(color: ColorUtils.c89c64()),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              new Expanded(
                child: new Container(
                    alignment: Alignment.bottomRight,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                          width: 25,
                          child: new RaisedButton(
                            child: new Text('-'),
                            highlightElevation: 5,
                            padding: EdgeInsets.all(0),
                            splashColor: Colors.white,
                            color: Colors.white,
                            highlightColor: Colors.white,
                            disabledColor: Colors.white,
                            onPressed: () {
                              _itemSubtractionClick(context, index);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 25,
                          child: new RaisedButton(
                            child:
                                new Text(mData[index].selectCount.toString()),
                            highlightElevation: 5,
                            padding: EdgeInsets.all(0),
                            splashColor: Colors.white,
                            color: Colors.white,
                            highlightColor: Colors.white,
                            disabledColor: Colors.white,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 25,
                          child: new RaisedButton(
                            child: new Text('+'),
                            highlightElevation: 5,
                            padding: EdgeInsets.all(0),
                            splashColor: Colors.white,
                            color: Colors.white,
                            highlightColor: Colors.white,
                            disabledColor: Colors.white,
                            onPressed: () {
                              _itemAddClick(context, index);
                            },
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        onTap: () => _itemClick(context, index));
  }

  _itemAddClick(BuildContext context, int index) {
    if (mData != null) {
      if (mData[index].allCount > mData[index].selectCount &&
          mData[index].select) {
        if (mounted) {
          setState(() {
            mData[index].selectCount = (mData[index].selectCount + 1);
          });
        }
      }
    }
  }

  _itemSubtractionClick(BuildContext context, int index) {
    if (mData != null) {
      if (mData[index].select && mData[index].selectCount > 1) {
        if (mounted) {
          setState(() {
            mData[index].selectCount = (mData[index].selectCount - 1);
          });
        }
      }
    }
  }

  _itemClick(BuildContext context, int index) {
    NavigatorUtils.goGoodsDetails(context, mData[index].goodsId);
  }
}
