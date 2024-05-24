import "package:confetti/confetti.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:animated_text_kit/animated_text_kit.dart';

class Contentpage extends StatefulWidget {
  const Contentpage({super.key});

  @override
  State<Contentpage> createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
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
    //var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                    emissionFrequency: 0.05, // Corregido a un valor válido
                    numberOfParticles: 50,
                    gravity: 1,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.pink]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image(
                                  image: AssetImage('assets/spidervers.gif'),
                                  height: 100,
                                  width: 100,
                                ),
                              ],
                            ),
                            height: 130.0,
                            width: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Hey hello Fernando",
                        style: GoogleFonts.poppins(
                            fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'Bobbers',
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText('Feliz'),
                              TyperAnimatedText('Cumpleaños'),
                              TyperAnimatedText('Fernando'),
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
      ),
    );
  }
}
