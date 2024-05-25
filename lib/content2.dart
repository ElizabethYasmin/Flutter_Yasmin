import 'package:flutter/material.dart';
import 'content.dart'; // Asegúrate de importar la pantalla Contentpage

class Content2 extends StatelessWidget {
  const Content2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Contentpage(),
            ));
          },
          child: Text('Volver a Contentpage'),
        ),
      ),
    );
  }
}
