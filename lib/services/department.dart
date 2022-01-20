import 'departmentData.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
class Department{
  List<DepartmentData> department = [] ;

  Future<void> getDepartment(id) async {
    try {
      var navUrl = Uri.https(
          'thepastq.herokuapp.com', '/department/faculty/$id', {'q': '{https}'});
      Response response = await get(navUrl);
      Map data = jsonDecode(response.body);
      List payload = data['data'];
      for(var i = 0;i<payload.length;i++){
        var id = payload[i]['id'];
        var name = payload[i]['name'];
        department.add(DepartmentData(id,name));
      }
    } catch (e) {
      print("error is $e");
    }
  }
}