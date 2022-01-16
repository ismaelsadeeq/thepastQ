import 'package:flutter/material.dart';
import 'package:past_q_and_m/pages/Level.dart';
import './pages/Loading.dart';
import './pages/Home.dart';
import './pages/department.dart';
import './pages/courses.dart';
import './pages/PassQ.dart';
import './pages/splashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute:'/',
      routes: {
        '/':(context)=>Splashing(),
        '/load':(context)=>Loading(),
        '/Home':(context)=>Home(),
        '/department':(context)=>Department(),
        '/courses':(context)=>MyCourses(),
        '/level':(context)=>Level(),
        '/passq':(context)=>PassQ()
      },
      debugShowCheckedModeBanner: false
    )
  );
}