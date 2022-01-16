import 'package:flutter/material.dart';
import 'package:past_q_and_m/services/fucultyData.dart';
import 'package:past_q_and_m/services/department.dart';
import 'package:past_q_and_m/services/departmentData.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FucultyData> data =  [];
  void loadDepartment(id) async{
    Department department = Department();
    await department.getDepartment(id);
    await Navigator.pushNamed(context, '/department',arguments:department.department);
  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data:ModalRoute.of(context)?.settings?.arguments as List<FucultyData>;

    return Scaffold(
      // backgroundColor:Colors.blueAccent[500],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Past Question and Materials'),
        elevation: 0.0,
        centerTitle: true,
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                    'Select a Faculty',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
            ListView.separated(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      onTap: () {
                        loadDepartment(data[index].id);
                        },
                      title: Text(
                          data[index].name,
                        style: GoogleFonts.roboto(
                            color: Colors.blueAccent
                        ),
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
