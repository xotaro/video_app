import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentsList extends StatefulWidget {
  @override
  const StudentsList({Key? key}) : super(key: key);
  _StudentsListState createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
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

            DataTable(
              columnSpacing: 30,
              columns: [
                DataColumn(label: Text(
                    'رقم الطالب',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                )),

                DataColumn(label: SingleChildScrollView(scrollDirection: Axis.horizontal,child: Text(
                    'الاسم',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                )),
                ),
                DataColumn(label: Text(
                    'تاريخ إنتهاء التسجيل',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1',textAlign: TextAlign.right)),
                  DataCell(Text('احمد طاهر عبد السلام',textAlign: TextAlign.right,),),
                  DataCell(Text('2021/8/2',textAlign: TextAlign.right)),
                ]),
                DataRow(cells: [
                  DataCell(Text('2',textAlign: TextAlign.right)),
                  DataCell(Text('احمد طاهر عبد السلام',textAlign: TextAlign.right,),),
                  DataCell(Text('2021/8/2',textAlign: TextAlign.right)),
                ]),
                DataRow(cells: [
                  DataCell(Text('3',textAlign: TextAlign.right)),
                  DataCell(Text('احمد طاهر عبد السلام',textAlign: TextAlign.right,),),
                  DataCell(Text('2021/8/2',textAlign: TextAlign.right)),
                ]),

              ],
            )),
          ])


    );
  }
}
