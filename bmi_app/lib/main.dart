import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  Color bgColor = Colors.orange.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Center(
              child: Text(
            'BMI Calculator',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30),
          )),
        ),
        body: Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Enter Your Details',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      'Enter Your Weight in Kgs',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    prefixIcon: Icon(
                      Icons.line_weight,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      'Enter Your Height in Feet',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text(
                      'Enter Your Height in Inches',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    prefixIcon: Icon(
                      Icons.height,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();
                    if (wt != "" && ft != "" && inch != "") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inch);
                      var height = iinch + ift * 12;
                      var fin = ((height * 2.54) / 100);
                      var bmi = iwt / pow(fin, 2);
                      var cat;
                      if (bmi >= 0 && bmi < 9) {
                        cat = 'Malnourished';
                        bgColor = Colors.amberAccent;
                      } else if (bmi >= 9 && bmi < 18) {
                        cat = 'Underweight';
                        bgColor = Colors.amberAccent.shade100;
                      } else if (bmi >= 18 && bmi <= 25) {
                        cat = 'Healthy';
                        bgColor = Colors.green.shade400;
                      } else if (bmi > 25 && bmi < 32) {
                        cat = 'Overweight';
                        bgColor = Colors.red.shade200;
                      } else {
                        cat = 'Obese';
                        bgColor = Colors.red;
                      }
                      result =
                          'Your BMI is ${bmi.toStringAsFixed(2)} \n Your category is $cat';
                      setState(() {});
                    } else {
                      setState(() {
                        result = 'Please enter all the details correctly !';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      backgroundColor: Colors.orange.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: Text(
                    "Calculate",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  child: Center(
                    child: Text(
                      result,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
