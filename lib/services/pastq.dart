import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:past_q_and_m/services/pass_q_data.dart';
class PassQ{
  List<PassQData> passQ =[];
  Future<void> getPassQ(String courseId) async {
    try {
      var navUrl = Uri.https(
          'thepastq.herokuapp.com', '/question/course/$courseId', {'q': '{https}'});
      Response response = await get(navUrl);
      Map data = jsonDecode(response.body);
      List payload = data['data'];
      for(var i = 0;i<payload.length;i++){
        var id = payload[i]['id'];
        var title = payload[i]['title'];
        var year = payload[i]['year'];
        var source = payload[i]['source'];
        source = source.substring(7);
        passQ.add(PassQData(id,title,year,source));
      }
    } catch (e) {
      print("error is $e");
    }
  }
}