import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/departmentData.dart';
import 'package:past_q_and_m/services/level.dart';
import 'package:past_q_and_m/services/levelData.dart';

class Department extends StatefulWidget {
  const Department({Key? key}) : super(key: key);

  @override
  _DepartmentState createState() => _DepartmentState();
}

class _DepartmentState extends State<Department> {
  List<DepartmentData> data = [];
  void loadLevel(id) async{
    Level level = Level();
    await level.getLevel(id);
    await Navigator.pushNamed(context, '/level',arguments:{
      'departmentId':id,
      'levels':level.level
    });
  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context)?.settings?.arguments as List<DepartmentData>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
            'Select Department'
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 2
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                        onTap: ()async {
                          loadLevel(data[index].id);
                        },
                        title: Text(
                            data[index].name
                        )
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return const SizedBox(height: 16.0,);
                },
                itemCount: data.length
            )
          ],
        ),
      ),
    );
  }
}
