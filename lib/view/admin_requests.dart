import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/view_models/admin_viewstudets_vm.dart';

class Requests extends StatefulWidget {
  @override
  const Requests({Key? key}) : super(key: key);
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  late ControlStudent _controlStudent;
  @override
  void initState() {
    _controlStudent=getIt<ControlStudent>();
    _controlStudent.loadRequests();

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
          title: Text('طلبات التسجيل',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),
        ),

        body:

        ChangeNotifierProvider.value(
          value: _controlStudent,
          child: ListView(children: <Widget>[
            SingleChildScrollView(scrollDirection: Axis.horizontal,child:

            Consumer<ControlStudent>(
              builder: (context, value, child) {

                return         _controlStudent.requestStudents.length!=0?     DataTable(
                  columnSpacing: 30,
                  columns: [
                    DataColumn(label: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(
                        'الاسم',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                    )),
                    ),
                    DataColumn(label: Text(
                        'تاريخ الطلب',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                    )),


                    DataColumn(label: Text(
                        'قبول',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                    )),
                    DataColumn(label: Text(
                        'رفض',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                    )),
                  ],
                  rows:
                    _controlStudent.requestStudents.map((s) =>

                        DataRow(cells: [
                          DataCell(Text(s.name,textAlign: TextAlign.right,),),
                          DataCell(Text('2021/8/2',textAlign: TextAlign.right)),
                          DataCell( ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 55),
                              child:ElevatedButton(

                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff0369CD)) ),
                                onPressed: () {
                                  _controlStudent.acceptStudent(s.id);
                                },
                                child: Icon(Icons.add_circle_outline,color:Colors.white),
                              ))),
                          DataCell( ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 55),
                              child:ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red) ),
                                onPressed: () {
                                  _controlStudent.cancelStudent(s.id);
                                },
                                child: Icon(Icons.cancel,color:Colors.white),
                              ))),
                        ])


                    ).toList()

                ):Center(child: Text(
                  'لا يوجد طلاب الان',style: TextStyle(fontSize: 20),
                ),
                );

              },
            )),
          ]),
        )


    );
  }
}
