import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/view/view_models/search_vm.dart';

import 'admin_student_control.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchViewModel _searchViewModel;
  TextEditingController nameController=TextEditingController();

  @override
  void initState() {
    _searchViewModel=getIt<SearchViewModel>();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0369CD),
        title: TextField(
          style:TextStyle(color: Colors.white,fontSize: 18) ,
          decoration: InputDecoration(
            hintText:"اسم الطالب هنا",
              hintStyle: TextStyle(color: Colors.white,fontSize: 18),
              fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white

                  )
                )
          ),
          controller: nameController,
          onChanged: (s){
            _searchViewModel.loadSearched(s);
          }
        ),
      ),
      body:           ListView(children: <Widget>[
        SingleChildScrollView(scrollDirection: Axis.horizontal,child:

        ChangeNotifierProvider.value(
          value: _searchViewModel,
          child: Consumer <SearchViewModel>(

              builder: (context, value, child) {
                List<Student> st=_searchViewModel.searchedStudents;
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
      ,
    );
  }
}
