import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'icono/flutterNew/my_flutter_app_icons.dart';
//import 'package:yasmin_flutter_1/BasePage.dart';
import 'package:yasmin_flutter_1/content.dart';
import 'package:yasmin_flutter_1/content1.dart';

import 'package:yasmin_flutter_1/content2.dart';

class BasePage extends StatefulWidget {
  final int initialPage;
  final Widget child;

  const BasePage({
    Key? key,
    required this.initialPage,
    required this.child,
  }) : super(key: key);

  @override
  BasePageState createState() => BasePageState();
}

class BasePageState extends State<BasePage> {
  late int _page;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
  }

  void _navigateToPage(int index) {
    setState(() {
      _page = index;
    });
    Widget page;
    switch (index) {
      case 0:
        page = Content1();
        break;
      case 1:
        page = Contentpage();
        break;
      case 2:
        page = Content2();
        break;
      default:
        page = Contentpage();
        break;
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => BasePage(initialPage: index, child: page)),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        color: Color.fromARGB(86, 0, 0, 0),
        index: _page,
        items: <Widget>[
          Icon(Icons.favorite, size: 30, color: Colors.pink),
          Icon(MyFlutterApp.spider, size: 30, color: Colors.blue),
          Icon(Icons.audiotrack, size: 30, color: Colors.green),
        ],
        onTap: _navigateToPage,
      ),
    );
  }
}
