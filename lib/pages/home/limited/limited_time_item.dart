import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/http/dio_utils.dart';
import 'package:mall/http/entity/home_limited_time_type_entity.dart';
import 'package:mall/http/entity/home_limited_time_type_goods_entity.dart';
import 'package:mall/http/request_url.dart';
import 'package:mall/utils/color_utils.dart';
import 'package:mall/utils/device.dart';
import 'package:mall/utils/navigator_utils.dart';

// ignore: must_be_immutable
class LimitedTimeItem extends StatefulWidget {
  HomeLimitedTimeTypeEntity params;

  LimitedTimeItem(HomeLimitedTimeTypeEntity entity) {
    this.params = entity;
  }

  @override
  State<StatefulWidget> createState() => _ExampleTypeState(params);
}

class _ExampleTypeState extends State<LimitedTimeItem>
    with AutomaticKeepAliveClientMixin {
  String mType;
  int page = 1;
  List<HomeLimitedTimeTypeGoodsEntity> mData =
      new List<HomeLimitedTimeTypeGoodsEntity>();
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isMore = true;

  _ExampleTypeState(HomeLimitedTimeTypeEntity params) {
    this.mType = params.type;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _onRefresh();
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

  Future<Null> _loadData() async {
    DioUtil().post(RequestUrl.HOME_LIMIT_TIME_TYPE_TO_GOODS_LIST,
        pathParams: null,
        data: {"type": mType, "page": page}, errorCallback: (statusCode, msg) {
      print('Http error code : $statusCode');
    }).then((data) {
      if (data != null) {
        (data as List).forEach((item) {
          HomeLimitedTimeTypeGoodsEntity entity =
              HomeLimitedTimeTypeGoodsEntity.fromJson(item);
          if (mounted) {
            setState(() {
              mData.add(entity);
            });
          }
        });

        Future.delayed(Duration(seconds: 3), () {
          setState(() {
            isMore = ((data as List).length < 20) ? false : true;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return _itemBuildView(context, index);
          },
          itemCount: mData.length,
          controller: _scrollController,
          physics: new AlwaysScrollableScrollPhysics(),
        ),
      ),
    );
  }

  Widget _itemBuildView(BuildContext context, int index) {
    return new GestureDetector(
        child: new Container(
          width: DeviceUrils.getDevicesWidth(context),
          child: new Column(
            children: <Widget>[
              new Container(
                height: 180,
                width: DeviceUrils.getDevicesWidth(context),
                child: new Image.network(
                  mData[index].pic,
                  fit: BoxFit.fill,
                ),
              ),
              new Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 8.0),
                child: new Text(mData[index].hint),
              ),
              new Container(
                color: ColorUtils.dfe0e3(),
                height: 10,
              )
            ],
          ),
        ),
        onTap: () => _itemClick(context, index));
  }

  _itemClick(BuildContext context, int index) {
    NavigatorUtils.goGoodsDetails(context, mData[index].goodsId);
  }
}
