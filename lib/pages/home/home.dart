import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_bottom_tab_bar/eachtab.dart';
import 'package:mall/custom/TitleBar.dart';
import 'package:mall/pages/home/limited/home_limited_time.dart';
import 'package:mall/pages/home/home_mine.dart';
import 'package:mall/pages/home/home_shop_bar.dart';
import 'package:mall/utils/color_utils.dart';

import 'home_main.dart';
import 'home_type.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EntryState();
  }
}

class EntryState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;
  int _selectedIndex = 0;
  String msgCount = "";
  var titles = ['首页', '分类', '限时特卖', '购物袋', '我的'];
  List<Widget> views;
  var icons = [
    Icons.home,
    Icons.play_arrow,
    Icons.child_friendly,
    Icons.fiber_new,
    Icons.mic_none
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(vsync: this, initialIndex: 0, length: titles.length);
    _tabController.addListener(() {
      setState(() => _selectedIndex = _tabController.index);
      print("liucheng-> ${_tabController.indexIsChanging}");
    });
    views = [
      HomeMain(),
      HomeType(),
      HomeLimitedTime(),
      HomeShopBar(),
      HomeMine(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: new Material(
          child: new Scaffold(
              appBar: new TitleBar().noTitleMainAppbar(context),
              bottomNavigationBar: SafeArea(
                child: new Container(
                  color: ColorUtils.mainColor(),
                  height: 46,
                  child: new Column(
                    children: <Widget>[
                      Divider(
                        height: 4,
                      ),
                      new Material(
                        color: ColorUtils.mainColor(),
                        child: new TabBar(
                          isScrollable: false,
                          controller: _tabController,
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.red,
                          labelPadding: EdgeInsets.all(0),
                          unselectedLabelColor: Colors.black,
                          tabs: <Widget>[
                            EachTab(
                                width: 70,
                                badgeNo: msgCount.toString(),
                                badgeColor: Colors.red,
                                height: 40,
                                padding: EdgeInsets.all(0),
                                icon: _selectedIndex == 0
                                    ? Image.asset(
                                        'assets/imgs/home/icon_home_tab_main_select.png',
                                        width: 20,
                                        height: 20,
                                      )
                                    : Image.asset(
                                        'assets/imgs/home/icon_home_tab_main_unselect.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                text: titles[0],
                                iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                textStyle: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            EachTab(
                                height: 40,
                                padding: EdgeInsets.all(0),
                                icon: _selectedIndex == 1
                                    ? Image.asset(
                                        'assets/imgs/home/icon_home_tab_type_select.png',
                                        width: 20,
                                        height: 20,
                                      )
                                    : Image.asset(
                                        'assets/imgs/home/icon_home_tab_type_unselect.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                text: titles[1],
                                iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                textStyle: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            EachTab(
                                height: 40,
                                padding: EdgeInsets.all(0),
                                icon: _selectedIndex == 2
                                    ? Image.asset(
                                        'assets/imgs/home/icon_home_tab_time_select.png',
                                        width: 20,
                                        height: 20,
                                      )
                                    : Image.asset(
                                        'assets/imgs/home/icon_home_tab_time_unselect.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                text: titles[2],
                                iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                textStyle: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            EachTab(
                                height: 40,
                                padding: EdgeInsets.all(0),
                                icon: _selectedIndex == 3
                                    ? Image.asset(
                                        'assets/imgs/home/icon_home_tab_shopbag_select.png',
                                        width: 20,
                                        height: 20,
                                      )
                                    : Image.asset(
                                        'assets/imgs/home/icon_home_tab_shopbag_unselect.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                text: titles[3],
                                iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                textStyle: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            EachTab(
                                height: 40,
                                padding: EdgeInsets.all(0),
                                icon: _selectedIndex == 4
                                    ? Image.asset(
                                        'assets/imgs/home/icon_home_tab_mine_select.png',
                                        width: 20,
                                        height: 20,
                                      )
                                    : Image.asset(
                                        'assets/imgs/home/icon_home_tab_mine_unselect.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                text: titles[4],
                                iconPadding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                                textStyle: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              body: SafeArea(
                  top: true,
                  child: new TabBarView(
                    physics: NeverScrollableScrollPhysics(), //设置滑动的效果，这个禁用滑动
                    controller: _tabController,
                    children: views,
                  )))),
    );
  }
}
