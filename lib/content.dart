import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart'; // Asegúrate de importar el paquete CurvedNavigationBar
import 'splashscreen.dart'; // Asegúrate de importar la pantalla Splashscreen
import 'icono/flutterNew/my_flutter_app_icons.dart';
import 'package:yasmin_flutter_1/BasePage.dart';
import 'package:yasmin_flutter_1/content.dart';
import 'package:yasmin_flutter_1/content1.dart';

import 'package:yasmin_flutter_1/content2.dart';

class Contentpage extends StatelessWidget {
  const Contentpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      initialPage: 1,
      child: SafeArea(
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
                            confettiController: ConfettiController(
                              duration: Duration(seconds: 30),
                            )..play(),
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
                            confettiController: ConfettiController(
                              duration: Duration(seconds: 30),
                            )..play(),
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
      ),
    );
  }
}
