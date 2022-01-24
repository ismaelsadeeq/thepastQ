import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'coursesData.dart';

class Courses {
  List<CoursesData> courses = [] ;

  Future<void> getCourses(String level,String semester) async {
    if (semester=="First Semester") {
      semester = "1";
    } else{
      semester = '2';
    }
    try {
      var navUrl = Uri.https(
          'thepastq.herokuapp.com', '/course/level/$level/$semester', {'q': '{https}'});
      Response response = await get(navUrl);
      Map data = jsonDecode(response.body);
      List payload = data['data'];
      for(var i = 0;i<payload.length;i++){
        var id = payload[i]['id'];
        var name = payload[i]['name'];
        var unit = payload[i]['unit'];
        var title = payload[i]['title'];
        courses.add(CoursesData(id,name,'$title'));
      }
    } catch (e) {
      print("error is $e");

    }
  }
}