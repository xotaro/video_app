import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/subject_info_card.dart';

class AdminAddCourse extends StatefulWidget {
  const AdminAddCourse({Key? key}) : super(key: key);

  @override
  _AdminAddCourseState createState() => _AdminAddCourseState();
}

class _AdminAddCourseState extends State<AdminAddCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('المقاطع',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 26,right: 27,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6'),
              SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6'),



            ],
          ),
        ),
      ),
    );
  }
}
