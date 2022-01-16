import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/courses.dart';
import 'package:past_q_and_m/services/coursesData.dart';
import 'package:google_fonts/google_fonts.dart';

class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  Map data = {};
  void loadCourses(level,departmentId) async {
    Courses courses = Courses();
    await courses.getCourses(departmentId, level, "First Semester");
    Navigator.pushNamed(context, '/courses',
      arguments: {
        'departmentId':departmentId,
        'level':level,
        'courses':courses.courses
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context)?.settings?.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
            'Select Level',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                        onTap: ()async {
                          loadCourses(data['levels'][index].name,data['departmentId']);
                        },
                        title: Text(
                            data['levels'][index].name,
                            style: GoogleFonts.roboto(
                                color: Colors.blueAccent
                            ),

                        )
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 16.0,);
                },
                itemCount: data['levels'].length
            )
          ],
        ),
      ),
    );
  }
}
