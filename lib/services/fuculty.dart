import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'fucultyData.dart';


class Fuculty {
  List<FucultyData> faculties = [];

  Future<void> getFuculties() async {
    try {
      var navUrl = Uri.https(
          'thepastq.herokuapp.com', '/faculty/all', {'q': '{https}'});
      Response response = await get(navUrl);
      Map data = jsonDecode(response.body);
      List payload = data['data'];
      for(var i = 0;i<payload.length;i++){
        var id = payload[i]['id'];
        var name = payload[i]['name'];
        faculties.add(FucultyData(id,name));
      }
    } catch (e) {
      print("error is $e");
    }

  }
}
