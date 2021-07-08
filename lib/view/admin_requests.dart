import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Requests extends StatefulWidget {
  @override
  const Requests({Key? key}) : super(key: key);
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
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

        ListView(children: <Widget>[
          SingleChildScrollView(scrollDirection: Axis.horizontal,child:

          DataTable(
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
            rows: [
              DataRow(cells: [
                DataCell(Text('احمد طاهر عبد السلام',textAlign: TextAlign.right,),),
                DataCell(Text('2021/8/2',textAlign: TextAlign.right)),
                DataCell( ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 55),
                    child:ElevatedButton(

                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff0369CD)) ),
                  onPressed: () {},
                  child: Icon(Icons.add_circle_outline,color:Colors.white),
                ))),
                DataCell( ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 55),
                    child:ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red) ),
                      onPressed: () {},
                      child: Icon(Icons.cancel,color:Colors.white),
                    ))),
              ]),
              DataRow(cells: [
                DataCell(Text('احمد طاهر عبد السلام',textAlign: TextAlign.right,),),
                DataCell(Text('2021/8/2',textAlign: TextAlign.right)),
                DataCell( ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 55),
                    child:ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff0369CD)) ),
                      onPressed: () {},
                      child: Icon(Icons.add_circle_outline,color:Colors.white),
                    ))),
                DataCell( ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 55),
                    child:ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red) ),
                      onPressed: () {},
                      child: Icon(Icons.cancel,color:Colors.white),
                    ))),
              ]),
              DataRow(cells: [
                DataCell(Text('احمد طاهر عبد السلام',textAlign: TextAlign.right,),),
                DataCell(Text('2021/8/2',textAlign: TextAlign.right)),
                DataCell( ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 55),
                    child:ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff0369CD)) ),
                      onPressed: () {},
                      child: Icon(Icons.add_circle_outline,color:Colors.white),
                    ))),
                DataCell( ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 55),
                    child:ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red) ),
                      onPressed: () {},
                      child: Icon(Icons.cancel,color:Colors.white),
                    ))),
              ]),

            ],
          )),
        ])


    );
  }
}
