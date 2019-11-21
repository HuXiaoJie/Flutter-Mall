import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/custom/TitleBar.dart';
import 'package:mall/http/dio_utils.dart';
import 'package:mall/http/entity/home_type_item_content_entity.dart';
import 'package:mall/http/entity/home_type_list_entity.dart';
import 'package:mall/http/request_url.dart';
import 'package:mall/pages/goods/goods_details.dart';
import 'package:mall/utils/color_utils.dart';
import 'package:mall/utils/device.dart';
import 'package:mall/utils/navigator_utils.dart';

class HomeType extends StatefulWidget {
  @override
  _ExampleTypeState createState() => _ExampleTypeState();
}

class _ExampleTypeState extends State<HomeType>
    with AutomaticKeepAliveClientMixin {
  List<HomeTypeListEntity> mData = new List<HomeTypeListEntity>();
  List<HomeTypeItemContentEntity> mItemData =
      new List<HomeTypeItemContentEntity>();

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    DioUtil().post(RequestUrl.HOME_TYPE_LIST, pathParams: null, data: null,
        errorCallback: (statusCode, msg) {
      print('Http error code : $statusCode');
    }).then((data) {
      if (data != null) {
        (data as List).forEach((item) {
          HomeTypeListEntity entity = HomeTypeListEntity.fromJson(item);
          if (mounted) {
            setState(() {
              mData.add(entity);
            });
          }
        });
        itemClickLeft(context, 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new TitleBar().noBackHomeAppbar(context, "商品分类"),
      body: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[_buildLeftListView(), _buildRightListView()],
      ),
    );
  }

  Widget _buildLeftListView() {
    return new Container(
      width: 100,
      child: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _itemLeftView(context, index);
        },
        itemCount: mData.length,
        itemExtent: 45,
      ),
    );
  }

  _itemLeftView(BuildContext context, int index) {
    return new GestureDetector(
        child: new Container(
          alignment: Alignment.center,
          color: mData[index].select ? ColorUtils.f7f7f7() : Colors.white,
          child: Text(mData[index].name),
        ),
        onTap: () => itemClickLeft(context, index));
  }

  itemClickLeft(BuildContext context, int index) {
    if (mData == null) {
      return;
    }
    mData.forEach((item) {
      item.select = false;
    });
    mData[index].select = true;
    if (mounted) {
      setState(() {
        mData = mData;
        mItemData.clear();
      });
    }
    _loadRightData(mData[index].id.toString());
  }

  _loadRightData(String type) {
    DioUtil().post(RequestUrl.HOME_TYPE_GOODS_LIST,
        pathParams: null,
        data: {"type": type}, errorCallback: (statusCode, msg) {
      print('Http error code : $statusCode');
    }).then((data) {
      if (data != null) {
        (data as List).forEach((item) {
          HomeTypeItemContentEntity entity =
              HomeTypeItemContentEntity.fromJson(item);
          setState(() {
            mItemData.add(entity);
          });
        });
      }
    });
  }

  Widget _buildRightListView() {
    return new Container(
      width: DeviceUrils.getDevicesWidth(context) - 100,
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _itemRightView(context, index);
        },
        itemCount: mItemData.length,
        scrollDirection: Axis.vertical,
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            //上下间隔
            mainAxisSpacing: 10.0,
            //左右间隔
            crossAxisSpacing: 10.0,
            //宽高比例
            childAspectRatio: 1.0),
      ),
    );
  }

  _itemRightView(BuildContext context, int index) {
    return new GestureDetector(
        child: Image.network(
          mItemData[index].pic,
          fit: BoxFit.fill,
        ),
        onTap: () => itemClickRight(context, index));
  }

  itemClickRight(BuildContext context, int index) {
    NavigatorUtils.goGoodsDetails(context, mItemData[index].id.toString());
  }
}
