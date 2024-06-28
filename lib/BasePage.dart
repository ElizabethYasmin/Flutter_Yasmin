import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'icono/flutterNew/my_flutter_app_icons.dart';
import 'content1.dart';
import 'content2.dart';

class BasePage extends StatefulWidget {
  final int initialPage;
  final Widget child;

  const BasePage({
    Key? key,
    required this.initialPage,
    required this.child,
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
          Content1(), // Ejemplo de Content1 con fondo rojo
          widget.child, // Widget.child que puede ser Contentpage con fondo diferente
          Content2(), // Ejemplo de Content2 con fondo azul
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(239, 9, 11, 99), // Fondo transparente del CurvedNavigationBar
        color: Color.fromARGB(255, 2, 2, 2), // Color de los íconos seleccionados
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
