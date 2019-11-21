import 'package:flutter/material.dart';
import 'package:mall/utils/color_utils.dart';

class TitleBar {
  backAppbar(BuildContext context, String title, {VoidCallback onPressed}) {
    return PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
          leading: _leading(context, onPressed),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }

  noTitleMainAppbar(BuildContext context, {VoidCallback onPressed}) {
    return PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: ColorUtils.mainColor(),
          elevation: 0,
        ));
  }


  noBackAppbar(BuildContext context, String title, {VoidCallback onPressed}) {
    return PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          centerTitle: true,
          leading: _leadingNoBack(context, onPressed),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }

  noBackHomeAppbar(BuildContext context, String title, {VoidCallback onPressed}) {
    return PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          centerTitle: true,
          leading: _leadingNoBack(context, onPressed),
          brightness: Brightness.light,
          backgroundColor: ColorUtils.mainColor(),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ));
  }

  _leadingNoBack(BuildContext context, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 44,
          padding: EdgeInsets.all(0),
          child: null,
        ),
      ],
    );
  }

  _leading(BuildContext context, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 44,
          padding: EdgeInsets.all(0),
          child: new IconButton(
            padding: EdgeInsets.only(left: 16, right: 16),
//            icon: Image.asset(
//              'assets/images/ic_black_left_arrow.png',
//              fit: BoxFit.contain,
//              width: 16,
//              height: 16,
//            ),
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              if (onPressed == null) {
                _popThis(context);
              } else {
                onPressed();
              }
            },
          ),
        ),
      ],
    );
  }

  _popThis(BuildContext context) {
    Navigator.of(context).pop();
  }
}
