import 'package:past_q_and_m/services/pass_q_data.dart';
class PassQ{
  List<PassQData> passQ =[];
  Future<void> getPassQ(String courseId) async {
    // try {} catch (e) {
    //   print("error is $e");
    passQ = [
      PassQData("1", "Front Page","2020/2021 Session","assets/Matlab.jpg"),
      PassQData("2", "Back Page","2020/2021 Session","assets/matlabBack.jpg"),
      PassQData("3", "Front Page","2018/2019 Session","assets/Matlab.jpg"),
      PassQData("4", "Back Page","2018/2019 Session","assets/matlabBack.jpg"),
    ];
    // }
  }
}