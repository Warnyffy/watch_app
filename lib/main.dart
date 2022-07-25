// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:watch1/page/Alarm.dart';
import 'package:watch1/page/watch.dart';
import 'package:watch1/tabs/home.dart';



void main() async {
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Watch',
      
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
       primarySwatch: Colors.pink
      ),
      
      home: Scaffold(
        
         body: const Center(
          child: Home(),
         ),
      ),
      debugShowCheckedModeBanner:false,
    );
  }
}



