import 'package:flutter/material.dart';
import 'package:mall/http/entity/home_limited_time_type_entity.dart';
import 'package:mall/utils/color_utils.dart';

class LimitedTabViewModel {
  final HomeLimitedTimeTypeEntity data;
  final Widget widget;

  const LimitedTabViewModel({
    this.data,
    this.widget,
  });
}

class DemoTabs extends StatelessWidget {
  final List<HomeLimitedTimeTypeEntity> data;
  final List<LimitedTabViewModel> demos;
  final bool tabScrollable;
  final TabController tabController;

  DemoTabs({
    this.data,
    this.demos,
    this.tabScrollable = true,
    this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            controller: this.tabController,
            isScrollable: this.tabScrollable,
            labelColor: ColorUtils.mainColor(),
            indicatorColor: ColorUtils.mainColor(),
            tabs: this.demos.map((item) => Tab(text: item.data.name)).toList(),
          ),
        ),
        preferredSize: Size.fromHeight(35),
      ),
      body: TabBarView(
        controller: this.tabController,
        children: this.demos.map((item) => item.widget).toList(),
      ),
    );
  }
}
