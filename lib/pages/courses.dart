import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/coursesData.dart';
import 'package:past_q_and_m/services/courses.dart';
import 'package:past_q_and_m/services/pass_q_data.dart';
import 'package:past_q_and_m/services/pastq.dart';
import 'package:google_fonts/google_fonts.dart';


class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  Map data = {};
  String dropDownValue = "First Semester";
  bool isFirst = false;
  List<String> semester = ['First Semester','Second Semester'];
  void reloadSemester(semester,level,departmentId) async{
      Courses courses = Courses();
      await courses.getCourses(level, semester);
      setState(() {
        data = {
          'departmentId':departmentId,
          'level':level,
          'courses':courses.courses
        };
      });
  }
  void loadCourses(course)async{
    PassQ passq = PassQ();
    await passq.getPassQ(course.id);
    Navigator.pushNamed(context, '/passq',
    arguments: {
      'course':course,
      'passq':passq.passQ
    });
  }
  @override @override
  void initState() {
    isFirst = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(isFirst){
      data = data.isNotEmpty?data:ModalRoute.of(context)?.settings?.arguments as Map;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
            'Select Course',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton(
              value: dropDownValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items:semester
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),

                );
              }).toList(),
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  dropDownValue = newValue!;
                });
                reloadSemester(newValue,data['level'],data['departmentId']);
              },
              style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blueAccent,
                ),

            ),
            ListView.separated(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                        onTap: ()async {
                          loadCourses(data['courses'][index]);
                        },
                        title: Text(
                            data['courses'][index].name,
                          style: GoogleFonts.roboto(
                              color: Colors.blueAccent
                          ),
                        ),
                        subtitle: Text(data['courses'][index].title,
                          style: GoogleFonts.roboto(
                              color: Colors.blueAccent
                          ),
                        ),
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 16.0,);
                },
                itemCount: data['courses'].length
            )
          ]
      ),
    );
  }
}
