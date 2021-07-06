import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/subject_info_card.dart';

class AddSubjects extends StatefulWidget {
  const AddSubjects({Key? key}) : super(key: key);

  @override
  _AddSubjectsState createState() => _AddSubjectsState();
}

class _AddSubjectsState extends State<AddSubjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('المواد',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 26,right: 27,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6'),
              SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6'),
              SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6'),


            ],
          ),
        ),
      ),
    );
  }
}
