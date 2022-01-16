import 'coursesData.dart';

class Courses {
  List<CoursesData> courses = [] ;

  Future<void> getCourses(String departmentId,String level,String semester) async {
    // try {} catch (e) {
    //   print("error is $e");
    courses = [
      CoursesData("1", "CSC 302","Introduction to Digital Design and Microprocessor 3 Units"),
      CoursesData("2", "CSC 304","Introduction to Agent Based Systems 3 Units"),
      CoursesData("2", "CSC 308","Database Design and Management 3 Units"),
      CoursesData("2", "CSC 310","Automata Theory, Computability and Formal Language 3 Units"),
      CoursesData("2", "CSC 316","Operating System II"),
      CoursesData("2","CSC 306", "Organization of Programming Languages"),
      CoursesData("2","CSC 302", "Introduction to Entrepreneurial Studies"),
    ];
    // }
  }
}