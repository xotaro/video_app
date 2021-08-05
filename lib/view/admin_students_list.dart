import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/view/view_models/admin_viewstudets_vm.dart';

class StudentsList extends StatefulWidget {
  @override
  const StudentsList({Key? key}) : super(key: key);
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  late ControlStudent _controlStudent;
  @override
  void initState() {
    _controlStudent=getIt<ControlStudent>();
    _controlStudent.loadActive();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('قائمة الطلاب',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),
      ),

          body:
          ListView(children: <Widget>[
    SingleChildScrollView(scrollDirection: Axis.horizontal,child:

            ChangeNotifierProvider.value(
              value: _controlStudent,
              child: Consumer <ControlStudent>(

                builder: (context, value, child) {
                  List<Student> st=_controlStudent.registeredStudents;
                  return
                    DataTable(
                      columnSpacing: 30,
                      columns: [
                        DataColumn(label: Text(
                            'رقم الطالب',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)
                        )),

                        DataColumn(label: SingleChildScrollView(
                            scrollDirection: Axis.horizontal, child: Text(
                            'الاسم',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)
                        )),
                        ),
                        DataColumn(label: Text(
                            'تاريخ إنتهاء التسجيل',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)
                        )),
                      ],
                      rows:
                      st.map((s) {
                        int i = 1;
                        return
                          DataRow(
                              cells: [
                            DataCell(
                                Text('${i++}', textAlign: TextAlign.right)),
                            DataCell(
                              Text(s.name, textAlign: TextAlign.right,),),
                            DataCell(
                                Text('2021/8/2', textAlign: TextAlign.right)),
                          ]);
                      }


                      ).toList(),


                    );
                }
              ),
            )),
          ])


    );
  }
}
