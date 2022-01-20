import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'levelData.dart';

class Level {
  List<LevelData> level = [] ;

  Future<void> getLevel(String departmentId) async {
    try {
      var navUrl = Uri.https(
          'thepastq.herokuapp.com', '/level/department/$departmentId', {'q': '{https}'});
      Response response = await get(navUrl);
      Map data = jsonDecode(response.body);
      List payload = data['data'];
      for(var i = 0;i<payload.length;i++){
        var id = payload[i]['id'];
        var name = payload[i]['name'];
        level.add(LevelData(id,name));
      }
    } catch (e) {
      print("error is $e");
    }
  }
}