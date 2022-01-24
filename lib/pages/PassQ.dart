import 'package:flutter/material.dart';
import 'package:past_q_and_m/pages/widgets/question_picture.dart';
import 'package:google_fonts/google_fonts.dart';

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
      floatingActionButton: FloatingActionButton(
        child: Text(
          '+',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w300
          ),
        ),
        onPressed: () {},
        backgroundColor: Colors.blue
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
            'Past Questions of ${data['course'].name}',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400
            ),
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
        child:GridView.builder(
          itemCount: data['passq'].length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
          itemBuilder: (context, index) {
            final question =  data['passq'][index];
            return QuestionPicture(passQ: question);
          },
        ),
      ),
    );
  }
}
