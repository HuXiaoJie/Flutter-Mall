import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mall/custom/TitleBar.dart';

import 'limited_content.dart';

class HomeLimitedTime extends StatefulWidget {
  @override
  _ExampleTypeState createState() => _ExampleTypeState();
}

class _ExampleTypeState extends State<HomeLimitedTime>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new TitleBar().noBackHomeAppbar(context, "限时特卖"),
      body: new HomeLimitedTimeContent(),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
