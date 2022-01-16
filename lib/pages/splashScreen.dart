import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import './Loading.dart';

class Splashing extends StatefulWidget {
  @override
  _SplashingState createState() => new _SplashingState();
}

class _SplashingState extends State<Splashing> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new Loading(),
        // title: new Text('Welcome In SplashScreen',
        //   style: new TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20.0
        //   ),),
        image:  Image.asset('assets/thepastQlogo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        // onClick: ()=>print("Flutter Egypt"),
        // loaderColor: Colors.red
    );
  }
}

