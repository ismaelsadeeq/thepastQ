import 'package:flutter/material.dart';
import 'package:past_q_and_m/pages/Level.dart';
import './pages/Loading.dart';
import './pages/Home.dart';
import './pages/department.dart';
import './pages/courses.dart';
import './pages/PassQ.dart';


void main() {
  runApp(
    MaterialApp(
      initialRoute:'/',
      routes: {
        '/':(context)=>Loading(),
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