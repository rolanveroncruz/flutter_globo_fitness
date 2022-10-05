// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:globo_fitness/shared/menu_drawer.dart';
import 'package:globo_fitness/shared/bottom_nav.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController txtHeight = TextEditingController();
  final TextEditingController txtWeight = TextEditingController();
  final double fontSize = 18;
  String result = '';
  bool isMetric = true;
  bool isImperial = false;
  double? height;
  double? weight;
  late List<bool> isSelected;
  String heightMessage = '';
  String weightMessage = '';
  @override
  void initState() {
    isSelected = [isMetric, isImperial];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    heightMessage =
        'Please insert your height in ${(isMetric) ? 'meters' : 'inches'}';
    weightMessage =
        'Please insert your weight in ${(isMetric) ? 'kilos' : 'pounds'}';
    return Scaffold(
        appBar: AppBar(title: Text('BMI Calculator')),
        bottomNavigationBar: BottomNav(),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            ToggleButtons(
                // ignore: sort_child_properties_last
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child:
                          Text('Metric', style: TextStyle(fontSize: fontSize))),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child:
                          Text('Imperial', style: TextStyle(fontSize: fontSize))),
                ], isSelected: isSelected, onPressed: toggleMeasure),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                  controller: txtHeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: heightMessage)),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                  controller: txtWeight,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: weightMessage)),
            ),
            ElevatedButton(
                onPressed: findBMI,
                child: Text('Calculate BMI', style: TextStyle(fontSize: fontSize))),
            Text(result, style: TextStyle(fontSize: fontSize))
          ]),
        ));
  }

  void toggleMeasure(value) {
    if (value == 0) {
      isMetric = true;
      isImperial = false;
    } else {
      isMetric = false;
      isImperial = true;
    }
    setState(() {
      isSelected = [isMetric, isImperial];
    });
  } //build

  void findBMI() {
    double bmi = 0;
    double height = double.tryParse(txtHeight.text) ?? 0;
    double weight = double.tryParse(txtWeight.text) ?? 0;
    if (isMetric) {
      bmi = (weight / (height * height));
    }else{
      bmi = weight * 703 /(height*height);
    }
    setState( (){
      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
    });
  }
  
}
