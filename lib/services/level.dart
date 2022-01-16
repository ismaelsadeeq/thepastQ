import 'levelData.dart';

class Level {
  List<LevelData> level = [] ;

  Future<void> getLevel(String departmentId) async {
    // try {} catch (e) {
    //   print("error is $e");
    level = [
      LevelData("1", "100"),
      LevelData("2", "200"),
      LevelData("3", "300"),
      LevelData("4", "400"),
      LevelData("5", "500"),
    ];
    // }
  }
}