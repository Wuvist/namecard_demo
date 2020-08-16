import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NameCard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NameCardBasic(),
    );
  }
}

class NameCardBasic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Container(
          width: 370,
          height: 250,
          color: Colors.blue,
          
        ),
      ),
    );
  }
}


