import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/fucultyData.dart';
import 'package:google_fonts/google_fonts.dart';


class SingleFaculty extends StatelessWidget {
  final FucultyData faculty;
  const SingleFaculty(
      {Key? key,
        required this.faculty
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          '${faculty.name}',
      ),
    );
  }
}
