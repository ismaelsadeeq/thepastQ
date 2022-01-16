import 'package:flutter/material.dart';
import 'package:past_q_and_m/pages/widgets/question_picture.dart';

class PassQ extends StatefulWidget {
  const PassQ({Key? key}) : super(key: key);

  @override
  _PassQState createState() => _PassQState();
}

class _PassQState extends State<PassQ> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context)?.settings?.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(

            'Past Questions of ${data['course'].name}'
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 2
        ),
        child :ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount:  data['passq'].length,
          itemBuilder: (context, index) {
            final question =  data['passq'][index];
            return QuestionPicture(passQ: question);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 16);
          },
        ),
        ),
      );
  }
}
