import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/view/admin_student_control.dart';
import 'package:video_app/view/search_page.dart';
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
        leading: InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  Directionality(textDirection: TextDirection.rtl,
                      child:  SearchPage()
                  )
              ),
            );

          },
          child: Icon(
            Icons.search,
            color: Color(0xff0369CD),
          ),
        ),
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
                  int i = 1;
                  return st.isEmpty?Center(
                    child:
                        CircularProgressIndicator()



                  ):
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
                          DataColumn(label: Text(
                              'معلومات',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)
                          )),
                        ],
                        rows:
                        st.map((s) {
                          return
                            DataRow(
                                cells: [
                              DataCell(
                                  Text('${i++}', textAlign: TextAlign.right)),
                              DataCell(
                                  Text(
                                    s.name.length > 10 ? s.name.substring(0, 10)+'...' : s.name,
                                    textAlign: TextAlign.right,
                                  )
                                ,),
                              DataCell(
                                  Text(s.endDate, textAlign: TextAlign.right)),
                                  DataCell(
                                      IconButton(
                                        icon: Icon(Icons.info_outline,color: Color(0xff0369CD) ,),
                                        onPressed: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>
                                                Directionality(textDirection: TextDirection.rtl,
                                                    child:  ControlStudentPage(student: s)
                                                )
                                                ),
                                          );
                                        },
                                      )
                                  ),
                            ])
                          ;
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
