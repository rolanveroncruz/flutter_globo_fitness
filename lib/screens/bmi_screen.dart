// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import 'package:globo_fitness/shared/bottom_nav.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(title: Text('BMI Calculator')),
            bottomNavigationBar: BottomNav(),
            drawer: MenuDrawer(),
            body: Center(child:FlutterLogo())
            );
      
  }
}
