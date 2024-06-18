import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:audioplayers/audioplayers.dart';


class Content1 extends StatefulWidget {
  const Content1({Key? key}) : super(key: key);

  @override
  _Content1State createState() => _Content1State();
}

class _Content1State extends State<Content1> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

void _playSound() async {
  //await _audioPlayer.play(Uri.parse('assets/audio/spidervers.mp3').toString(), isLocal: true);
  _audioPlayer.play(AssetSource('audio/m3.mp3'));
}

  void _showDialog(BuildContext context) {
    _playSound();  // Reproducir sonido antes de mostrar el diálogo

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Colors.pink[50],
          title: Row(
            children: [
              Icon(Icons.cake, color: Colors.pink),
              SizedBox(width: 10),
              Text(
                '¡Feliz cumpleaños!',
                style: TextStyle(color: Colors.pink[900]),
              ),
            ],
          ),
          content: Text(
              "¡Feliz cumpleaños, querido hermano! 🎉 En este día especial quiero recordarte lo mucho que te quiero y admiro. Eres mi ejemplo a seguir, siempre mostrándome el mejor camino con tu bondad, sabiduría y valentía. Que este nuevo año te traiga todo lo mejor que mereces. Solo me queda agradecerte por ser mi hermano mayor, 🙏 sé lo mucho que te esfuerzas, lo mucho que luchas por nosotros. Por eso te doy gracias, espero que te guste este pequeño presente, y nunca olvides que aqui tienes una hermana y una familia que darian todo por ti 💖 ¡Celebra en grande y que la felicidad te acompañe siempre! 🎉🎂🎈🌟💖",
              style: TextStyle(fontSize: 16, color: Colors.pink[700]),
          ),
          elevation: 10,
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cerrar',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtener el color base del tema
    Color? baseColor = Theme.of(context).primaryColor;

    return Scaffold(
      body: Stack(
        children: [
          // Animación Rive
          RiveAnimation.asset(
            'assets/rive/into_the_rive-verse.riv',
            fit: BoxFit.cover,
          ),
          // Botón en la parte superior derecha
          Positioned(
            top: 50,
            right: 20,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: baseColor == Colors.blue
                    ? MaterialStateProperty.all(Colors.blue)
                    : MaterialStateProperty.all(Color.fromARGB(255, 175, 1, 1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                elevation: MaterialStateProperty.all<double>(5),
              ),
              onPressed: () {
                _showDialog(context);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Mostrar mensaje',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Content1(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ));
