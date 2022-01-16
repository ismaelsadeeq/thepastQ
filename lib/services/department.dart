import 'departmentData.dart';

class Department{
  List<DepartmentData> department = [] ;

  Future<void> getDepartment(id) async {
    // try {} catch (e) {
    //   print("error is $e");
    department = [
      DepartmentData("1", "Computer Science"),
      DepartmentData("2", "Statistics"),
      DepartmentData("2", "Geology"),
      DepartmentData("2", "Mathematics"),
      DepartmentData("2", "Physics"),
      DepartmentData("2", "Operations Research"),
    ];
    // }
  }
}