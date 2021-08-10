import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/view/subject_card.dart';
import 'package:video_app/view/view_models/admin_control_vm.dart';

class ControlStudentPage extends StatefulWidget {
  final Student student;
  const ControlStudentPage({Key? key, required this.student}) : super(key: key);

  @override
  _ControlStudentPageState createState() => _ControlStudentPageState();
}

class _ControlStudentPageState extends State<ControlStudentPage> {
  late ControlStudentViewModel _controlStudentViewModel;
  @override
  void initState() {
    _controlStudentViewModel=getIt<ControlStudentViewModel>();
    _controlStudentViewModel.loadWatchedVideos(widget.student.id);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(

            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
            onPressed: (){
              Navigator.of(context).pop();

            }
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('بيانات الطالب',style: TextStyle(color:Color(0xff0369CD),fontSize: 25),),
        centerTitle: true,
      ),
      body:  ChangeNotifierProvider.value(
        value: _controlStudentViewModel,
        child: SingleChildScrollView(
          child: Padding(
                      padding: EdgeInsets.only(right: 28,top: 31),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(padding: EdgeInsets.only(bottom: 18),
                              child: OutlinedButton(
                                onPressed: () {
                                  _controlStudentViewModel.cancelStudent(widget.student.id);
                                  Navigator.of(context).pop();
                                }, child: Text('حذف الطالب',style: TextStyle(color: Colors.white),),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.red
                                ),

                              )
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 18),
                            child: Row(
                              children: [
                                Text('الاسم الثلاثي: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                                Text(widget.student.name,style: TextStyle(fontSize: 18),)
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 18),
                              child: Row(
                                children: [
                                  Text('رقم الهاتف: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                                  Text(widget.student.phone,style: TextStyle(fontSize: 18),)
                                ],
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 18),
                              child: Row(
                                children: [
                                  Text('رقم هاتف ولي الامر: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                                  Text(widget.student.parent,style: TextStyle(fontSize: 18),)
                                ],
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 18),
                              child: Row(
                                children: [
                                  Text('نهايه الاشتراك: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                                  Text(widget.student.endDate==''?'لم يتم بعد':widget.student.endDate,style: TextStyle(fontSize: 18),)
                                ],
                              )),
                          Row(
                            children: [
                              Text('الصف: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                              Text(widget.student.grade==1?'الصف الثاني الثانوي':'الصف الثالث الثانوي',style: TextStyle(fontSize: 18),)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,left: 10),
                            child: Consumer<ControlStudentViewModel>(
                              builder: (context, value, child) =>
                              _controlStudentViewModel.watchedVideosByStudent.isEmpty?Text('لم يشاهد شئ الى الان',
                                style: TextStyle(color: Colors.black,fontSize: 20),):
                              Column(
                                  children:
                                  _controlStudentViewModel.watchedVideosByStudent.map((e) =>

                                      SubjectCard('assets/algebra.jpg',e.subjectName , Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(e.unitName,
                                            style: TextStyle(color: Color(0xff0369CD)),overflow: TextOverflow.ellipsis,),
                                          Text(''),
                                          Text(e.lessonName, style: TextStyle(color: Color(0xff0369CD),),overflow: TextOverflow.ellipsis),
                                          Text('عدد المشاهدات المتبقيه: ${e.watched}',
                                              style: TextStyle(color: Color(0xff0369CD),fontWeight: FontWeight.bold)),
                                          TextButton(onPressed: (){
                                            _controlStudentViewModel.addWatchValue(widget.student.id, e.videoId);
                                          }, child: Text('اضافه مشاهده',style: TextStyle(color: Colors.white),),
                                          style: TextButton.styleFrom(
                                            backgroundColor: Color(0xff0369CD)
                                          ),)

                                        ],
                                      )),

                                  ).toList()

                              ),
                            ),
                          )


                        ],
                      ),
                    ),
        ),
      )



    );
  }
}
