import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:timepass/introPage.dart';
import 'package:timepass/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
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

  var arrNames = [
    {'name': 'Vedika', 'number': 1234567890, 'unread': 8},
    {'name': 'Not Vedika', 'number': 1234567890, 'unread': 11},
    {'name': 'Real Vedika', 'number': 1234567890, 'unread': 30},
    {'name': 'Nakli Vedika', 'number': 1234567890, 'unread': 5},
    {'name': 'Why Vedika', 'number': 1234567890, 'unread': 3},
    {'name': 'I am Vedika', 'number': 1234567890, 'unread': 6},
    {'name': 'Laut Aao Vedika', 'number': 1234567890, 'unread': 1},
    {'name': 'Vedika Spam', 'number': 1234567890, 'unread': 2},
    {'name': 'Vedika Jio', 'number': 1234567890, 'unread': 4},
  ];
  var arrColors = [
    'red',
    'blue',
    'green',
    'yellow',
    'cyan',
    'pink',
    'black',
    'orange',
    'amber',
    'brown',
  ];
  var count = 0;
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    var emailText = TextEditingController();
    var passText = TextEditingController();
    var time = DateTime.now();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Center(
              child: Text(
            'Whatsapp',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          )),
        ),
        body: Container(
          child: ListView(
            children: arrNames.map((value) {
              return ListTile(
                leading: const Icon(Icons.account_circle),
                title: Text(
                  value['name'].toString(),
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  value['number'].toString(),
                  style: TextStyle(fontSize: 15),
                ),
                trailing: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.green,
                    child: Text(value['unread'].toString(), style: TextStyle(color: Colors.white),),),
              );
            }).toList(),
          ),
        ));
  }
}
