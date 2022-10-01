// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Globo Fitness')),
            body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/handstand.jpg'),
                        fit: BoxFit.cover)),
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white70,
                        ),
                        child: Text(
                            'Commit to be fit, dare to be great with Globo Fitness!',
                            style: TextStyle(fontSize: 22, shadows: const [
                              Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                  color: Colors.grey)
                            ])))))));
  }
}
