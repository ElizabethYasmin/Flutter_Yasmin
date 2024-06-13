import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'icono/flutterNew/my_flutter_app_icons.dart';
import 'content.dart';
import 'content1.dart';
import 'content2.dart';

class BasePage extends StatefulWidget {
  final int initialPage;
  final Widget child; // Agregamos la definición de child aquí

  const BasePage({
    Key? key,
    required this.initialPage,
    required this.child, // Asegúrate de incluir child en el constructor
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late int _page;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _page = widget.initialPage;
    _pageController = PageController(initialPage: _page);
  }

  void _navigateToPage(int index) {
    setState(() {
      _page = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _page = index;
          });
        },
        children: [
          Content1(),
          widget.child, // Aquí usamos el widget.child que se pasa desde Contentpage
          Content2(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color.fromARGB(253, 0, 0, 0),
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
