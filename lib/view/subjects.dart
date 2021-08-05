import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/subject_info_card.dart';
import 'package:video_app/view/videos_list.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
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
              InkWell(
               child: SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6',),
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        Directionality(textDirection: TextDirection.rtl, child: ListVideos())),
                  );
                },

              ),
              InkWell(
                child: SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6',),
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        Directionality(textDirection: TextDirection.rtl, child: ListVideos())),
                  );
                },

              ),
              InkWell(
                child: SubjectInfo('الجبر و الهندسه الفراعيه','6/12','6',),
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        Directionality(textDirection: TextDirection.rtl, child: ListVideos())),
                  );
                },

              ),


            ],
          ),
        ),
      ),
    );
  }
}
