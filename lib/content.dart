import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:yasmin_flutter_1/splashscreen.dart';
import 'package:yasmin_flutter_1/basepage.dart';

class Contentpage extends StatefulWidget {
  const Contentpage({Key? key}) : super(key: key);

  @override
  _ContentpageState createState() => _ContentpageState();
}

class _ContentpageState extends State<Contentpage> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playMusic();
  }

  void _playMusic() async {
    await _audioPlayer.play(AssetSource('audio/sonidito.mp3'));
    //await _audioPlayer.play('audio/m3.mp3'); // Asegúrate de que 'audio/m3.mp3' sea tu ruta correcta
    setState(() {
      _isPlaying = true;
    });
  }

  @override
  void dispose() {
    _audioPlayer.stop(); // Detener la reproducción al salir de la página
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      initialPage: 1,
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
                                      height: 800,
                                      width: 800,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 80),
                            Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: DefaultTextStyle(
                                    style: const TextStyle(
                                      fontSize: 40,
                                      color: Color.fromARGB(255, 4, 248, 16),
                                      fontFamily: 'FuenteYasmin', // Nombre de tu fuente personalizada
                                      shadows: [
                                        Shadow(
                                          blurRadius: 7.0,
                                          color: Colors.white,
                                          offset: Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                        FlickerAnimatedText('Feliz'),
                                        FlickerAnimatedText('Cumpleaños'),
                                        FlickerAnimatedText("Fernando!"),
                                      ],
                                      onTap: () {
                                        print("Tap Event");
                                      },
                                    ),
                                  ),
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
                    size: 40,
                  ),
                  onPressed: () {
                    _audioPlayer.stop(); // Detener la música al cambiar de vista
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
