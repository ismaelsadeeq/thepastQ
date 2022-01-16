// import 'package:http/http.dart';
// import 'package:intl/intl.dart';

import 'fucultyData.dart';

class Fuculty {
  List<FucultyData> faculties = [];

  Future<void> getFuculties() async {
    // try {} catch (e) {
    //   print("error is $e");
      faculties = [
        FucultyData("1", "Physical Sciences"),
        FucultyData("2", "Life Sciences"),
        FucultyData("2", "Environmental Science"),
        FucultyData("2", "Agriculture"),
        FucultyData("2", "Engineering and Engineering Technology"),
        FucultyData("2", "Education"),

      ];
    // }
  }
}
