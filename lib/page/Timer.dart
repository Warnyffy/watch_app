// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({ Key? key }) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timer')),
      body: Center(
        child: Text('Timer screen', style: TextStyle(fontSize:40)),
      ),
    );
  }
}