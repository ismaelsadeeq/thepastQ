import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/pass_q_data.dart';


class QuestionPicture extends StatelessWidget {

  final PassQData passQ;

  const QuestionPicture(
      {Key? key,
        required this.passQ
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      constraints: const BoxConstraints.expand(
        width: 450,
        height: 500,
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            passQ.title,
          ),
          Text(
            passQ.year,
          ),
          Expanded(
            child: ClipRRect(
              child: Image.asset(
               '${passQ.source}',
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}
