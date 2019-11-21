import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mall/custom/TitleBar.dart';
import 'package:mall/http/dio_utils.dart';
import 'package:mall/http/entity/home_main_entity.dart';
import 'package:mall/http/request_url.dart';
import 'package:mall/utils/device.dart';

class HomeMain extends StatefulWidget {
  @override
  _Example4State createState() => _Example4State();
}

class _Example4State extends State<HomeMain>
    with AutomaticKeepAliveClientMixin {
  HomeMainEntity mData;

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("==============");
    _loadData();
  }

  _loadData() {
    DioUtil().post(RequestUrl.HOME_MAIN, pathParams: null, data: null,
        errorCallback: (statusCode, msg) {
      print('Http error code : $statusCode');
    }).then((data) {
      if (data != null) {
        HomeMainEntity entity = HomeMainEntity.fromJson(data);
        if(mounted) {
          setState(() {
            mData = entity;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new TitleBar().noTitleMainAppbar(context),
      body: new CustomScrollView(shrinkWrap: true, slivers: <Widget>[
        new SliverPadding(
          padding: EdgeInsets.all(0),
          sliver: new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
            Column(
              children: <Widget>[_buildBanner(), _buildColumn(context)],
            ),
          ])),
        ),
      ]),
    );
  }

  Widget _buildBanner() {
    if (mData != null && mData.banner != null) {
      return new Container(
        height: 200,
        child: Swiper(
          autoplay: true,
          autoplayDelay: 10000,
          scrollDirection: Axis.horizontal,
          pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  size: 5, //点点没选中时候的大小
                  activeSize: 8, //点点选中后的大小
                  color: Colors.white, //点点的颜色
                  activeColor: Colors.deepOrangeAccent),
              alignment: Alignment.bottomCenter),
          itemCount: mData.banner.length,
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              mData.banner[index].url,
              fit: BoxFit.fill,
            );
          },
          onTap: (index) {
            Fluttertoast.showToast(msg: index.toString());
          },
        ),
      );
    } else {
      return Text("");
    }
  }

  Widget _buildColumn(BuildContext context) {
    if (mData != null && mData.column != null) {
      return Container(
        height: DeviceUrils.getDevicesWidth(context),
        child: new Row(
          children: <Widget>[
            new Expanded(
                flex: 1,
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                          child: new GestureDetector(
                        child: Image.network(
                          mData.column[0],
                          fit: BoxFit.fill,
                        ),
                        onTap: () {
                          print("----");
                        },
                      )),
                      new Expanded(
                          child: new GestureDetector(
                        child: Image.network(
                          mData.column[1],
                          fit: BoxFit.fill,
                        ),
                        onTap: () {
                          print("----");
                        },
                      )),
                      new Expanded(
                          child: new GestureDetector(
                        child: Image.network(
                          mData.column[2],
                          fit: BoxFit.fill,
                        ),
                        onTap: () {
                          print("----");
                        },
                      ))
                    ],
                  ),
                )),
            new Expanded(
                flex: 1,
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                          flex: 1,
                          child: new GestureDetector(
                            child: Image.network(
                              mData.column[3],
                              fit: BoxFit.fill,
                            ),
                            onTap: () {
                              print("----");
                            },
                          )),
                      new Expanded(
                          flex: 2,
                          child: new GestureDetector(
                            child: Image.network(
                              mData.column[4],
                              fit: BoxFit.fill,
                            ),
                            onTap: () {
                              print("----");
                            },
                          )),
                    ],
                  ),
                )),
          ],
        ),
      );
    } else {
      return Text("");
    }
  }
}
