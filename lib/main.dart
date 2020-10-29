import 'package:flutter/material.dart';
import 'package:futternews/News/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home:Home()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
