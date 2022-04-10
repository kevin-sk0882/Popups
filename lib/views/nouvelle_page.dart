import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  String title;
  NewPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Je suis sur la nouvelle page",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.teal, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
