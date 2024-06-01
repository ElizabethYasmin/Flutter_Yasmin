import 'package:flutter/material.dart';
import 'package:yasmin_flutter_1/content.dart';

class Content1 extends StatelessWidget {
  const Content1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Content 1'),
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

