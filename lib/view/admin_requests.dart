import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_checkbox_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/view_models/admin_viewstudets_vm.dart';

import 'admin_student_control.dart';

class Requests extends StatefulWidget {
  @override
  const Requests({Key? key}) : super(key: key);
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  late ControlStudent _controlStudent;
  String startChosen='not Chosen';
  List<String> subjects=[];
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
                  dataRowHeight: 60,
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
                        'المواد',
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
                    DataColumn(label: Text(
                        'معلومات',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
                    )),
                  ],
                  rows:
                    _controlStudent.requestStudents.map((s) =>

                        DataRow(cells: [
                          DataCell(Text(s.name,textAlign: TextAlign.right,),),
                          DataCell(TextButton(
                            onPressed: () async {
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                helpText: 'يرجى ادخال تاربخ بدأ التسجيل',
                                cancelText: 'الغاء',
                                confirmText: 'اضافه',

                                initialDate: DateTime.now(),
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2035),
                                textDirection: TextDirection.rtl,
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.light().copyWith(
                                      textTheme: TextTheme(overline:  TextStyle(fontSize: 15,),
                                          button: TextStyle(fontSize: 18,)),
                                      primaryColor: const Color(0xff0369CD),
                                      accentColor: const Color(0xff0369CD),
                                      colorScheme: ColorScheme.light(primary: const Color(0xff0369CD)),
                                      buttonTheme: ButtonThemeData(
                                          textTheme: ButtonTextTheme.primary
                                      ),

                                    ),
                                    child: (child)!,
                                  );
                                },
                              );
                              if (picked != null){
                                List<String> now =picked.toString().split(' ');
                                startChosen=now[0];
                              }
                            },
                            child: Text('تغيير ميعاد البدأ؟\n'+s.startDate,textAlign: TextAlign.right
                            ),
                          )),
                          DataCell( ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 55),
                              child:ElevatedButton(

                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green) ),
                                onPressed: () async {
                                  final List<String>? s=await showMaterialCheckboxPicker<String>(items: [
                                    'جبر',
                                    'تفاضل',
                                    'استاتيكا',
                                    'ديناميكا'
                                    'هندسة فراغية',
                                  ], context: context,
                                    title: 'أختر المواد',
                                  );
                                  if(s==null || s.length==0) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: const Text(
                                            'لم يتم تحديد مواد',
                                            textAlign: TextAlign.right,),
                                          actions: [
                                            TextButton(
                                              child: Text('حسنا'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                }else{
                                    subjects=s;
                                  }
                                },
                                child: Icon(Icons.book,color:Colors.white),
                              ))),
                          DataCell( ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 55),
                              child:ElevatedButton(

                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xff0369CD)) ),
                                onPressed: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    helpText: 'يرجى ادخال تاربخ انتهاء التسجيل',
                                    cancelText: 'الغاء',
                                    confirmText: 'اضافه',

                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2021),
                                    lastDate: DateTime(2035),
                                    textDirection: TextDirection.rtl,
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          textTheme: TextTheme(overline:  TextStyle(fontSize: 15,),
                                              button: TextStyle(fontSize: 18,)),
                                          primaryColor: const Color(0xff0369CD),
                                          accentColor: const Color(0xff0369CD),
                                          colorScheme: ColorScheme.light(primary: const Color(0xff0369CD)),
                                          buttonTheme: ButtonThemeData(
                                              textTheme: ButtonTextTheme.primary
                                          ),
                                          
                                        ),
                                        child: (child)!,
                                      );
                                    },
                                  );
                                  if (picked != null){
                                    List<String> now =picked.toString().split(' ');

                                    if(subjects.length!=0){
                                      _controlStudent.acceptStudent(s.id,now[0],startChosen,context,subjects);
                                      _controlStudent.loadRequests();
                                    }else{
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: const Text(
                                              'لم يتم تحديد مواد',
                                              textAlign: TextAlign.right,),
                                            actions: [
                                              TextButton(
                                                child: Text('حسنا'),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                },
                                child: Icon(Icons.add_circle_outline,color:Colors.white),
                              ))),
                          DataCell(
                              ConstrainedBox(
                              constraints: BoxConstraints.tightFor(width: 55),
                              child:ElevatedButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red) ),
                                onPressed: () {
                                  _controlStudent.cancelStudent(s.id);
                                  _controlStudent.loadRequests();
                                },
                                child: Icon(Icons.cancel,color:Colors.white),
                              ))
                          ),
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
