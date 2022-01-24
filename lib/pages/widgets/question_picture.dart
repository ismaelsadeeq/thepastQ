import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/pass_q_data.dart';
import 'package:google_fonts/google_fonts.dart';



class QuestionPicture extends StatelessWidget {

  final PassQData passQ;

  const QuestionPicture(
      {Key? key,
        required this.passQ
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/singlePastQ',arguments: passQ);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.network(
                  '${passQ.source}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}