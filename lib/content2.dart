import 'package:flutter/material.dart';
import 'package:yasmin_flutter_1/BasePage.dart';
import 'package:yasmin_flutter_1/content.dart';
import 'package:yasmin_flutter_1/content1.dart';

import 'package:yasmin_flutter_1/content2.dart';

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
