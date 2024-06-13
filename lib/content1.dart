import 'package:flutter/material.dart';
import 'package:yasmin_flutter_1/content.dart';
import 'package:rive/rive.dart';

class Content1 extends StatelessWidget {
  const Content1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content 1'),
      ),

      body: Stack( // Utiliza un Stack para superponer la animación sobre el contenido
        children: [
          // Primer elemento del Stack: la animación Rive
          RiveAnimation.asset(
            'assets/rive/into_the_rive-verse.riv',
            fit: BoxFit.cover, // Ajusta la animación para cubrir toda la pantalla
          ),

      Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Contentpage(),
            ));
          },
          child: Text('Volver a Contentpage'),
    ),
          ),
        ],
      ),
    );
  }
}
