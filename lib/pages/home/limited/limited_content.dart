import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mall/http/dio_utils.dart';
import 'package:mall/http/entity/home_limited_time_type_entity.dart';
import 'package:mall/http/request_url.dart';
import 'limited_tabs.dart';
import 'limited_time_item.dart';

class HomeLimitedTimeContent extends StatefulWidget {
  @override
  _ExampleTypeState createState() => _ExampleTypeState();
}

class _ExampleTypeState extends State<HomeLimitedTimeContent>
    with TickerProviderStateMixin {
  List<HomeLimitedTimeTypeEntity> mData = new List<HomeLimitedTimeTypeEntity>();
  List<LimitedTabViewModel> mTypeData = new List<LimitedTabViewModel>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
//    this.tabController.dispose();
  }

  _loadData() {
    DioUtil().post(RequestUrl.HOME_LIMIT_TIME_TYPE_LIST,
        pathParams: null, data: null, errorCallback: (statusCode, msg) {
      print('Http error code : $statusCode');
    }).then((data) {
      if (data != null) {
        (data as List).forEach((item) {
          HomeLimitedTimeTypeEntity entity =
              HomeLimitedTimeTypeEntity.fromJson(item);
          if (mounted) {
            setState(() {
              mData.add(entity);
              mTypeData.add(new LimitedTabViewModel(
                  data: entity, widget: LimitedTimeItem(entity)));
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: DemoTabs(
        data: mData,
        demos: mTypeData,
        tabController: new TabController(length: mTypeData.length, vsync: this),
      ),
    );
  }
}
