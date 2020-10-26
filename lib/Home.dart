import 'package:flutter/material.dart';

class Home extends StatefulWidget {
   String title = "Welcome to Powermax";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        backgroundColor: Colors.red[800],
      ),
      body: Text("Home"),
    );
  }
}