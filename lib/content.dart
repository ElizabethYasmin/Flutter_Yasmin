import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Asegúrate de importar el paquete CurvedNavigationBar
import 'splashscreen.dart'; // Asegúrate de importar la pantalla Splashscreen
import 'icono/flutterNew/my_flutter_app_icons.dart';

class Contentpage extends StatefulWidget {
  const Contentpage({super.key});

  @override
  State<Contentpage> createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  late ConfettiController _controllerTopCenter;

  @override
  void initState() {
    super.initState();
    _controllerTopCenter = ConfettiController(duration: Duration(seconds: 30));
    _controllerTopCenter.play();
  }

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 214, 40, 40),
              Color.fromARGB(255, 0, 48, 73)
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            backgroundColor: Colors.transparent,
            color: Color.fromARGB(86, 0, 0, 0),
            items: <Widget>[
              Icon(Icons.favorite, size: 30, color: Colors.pink),
              Icon(MyFlutterApp.spider, size: 30, color: Colors.blue),
              Icon(Icons.audiotrack, size: 30, color: Colors.green),
            ],
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ConfettiWidget(
                          confettiController: _controllerTopCenter,
                          blastDirection: 0,
                          maxBlastForce: 5,
                          minBlastForce: 2,
                          emissionFrequency: 0.05,
                          numberOfParticles: 50,
                          gravity: 1,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ConfettiWidget(
                          confettiController: _controllerTopCenter,
                          blastDirection: 3.14,
                          maxBlastForce: 5,
                          minBlastForce: 2,
                          emissionFrequency: 0.05,
                          numberOfParticles: 50,
                          gravity: 1,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Center(
                              child: SizedBox(
                                height: 400.0,
                                width: 400.0,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('assets/spidervers.gif'),
                                      height: 900,
                                      width: 900,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Center(
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  fontSize: 50.0,
                                  fontFamily: 'Bobbers',
                                ),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TyperAnimatedText('Feliz'),
                                    TyperAnimatedText('Cumpleaños'),
                                    TyperAnimatedText('FERNANDO!!!'),
                                    TyperAnimatedText('...'),
                                  ],
                                  onTap: () {
                                    print("Tap Event");
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Splashscreen(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
