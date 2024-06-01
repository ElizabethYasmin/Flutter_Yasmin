import 'package:flutter/material.dart';

class Content2 extends StatelessWidget {
  const Content2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content 2'),
      ),
      body: Center(
        child: Text('Este es el contenido de la página 2'),
      ),
    );
  }
}
