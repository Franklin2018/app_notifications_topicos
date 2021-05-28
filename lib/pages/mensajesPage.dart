import 'package:flutter/material.dart';

class MensajesPage extends StatelessWidget {
  //const MensajesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No data';

    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes'),
      ),
      body: Center(
        child: Text(
          '$args',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
