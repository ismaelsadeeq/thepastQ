import 'package:flutter/material.dart';
import '../services/fuculty.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getFucultiesData()async {
    Fuculty  fuculties = Fuculty();
    await fuculties.getFuculties();
    Navigator.pushReplacementNamed(context, '/Home',arguments: fuculties.faculties);
  }
  @override
  void initState(){
    getFucultiesData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 60.0,
          ),
        ),
      ),
    );
  }
}

