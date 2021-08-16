import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/subject_card.dart';
import 'package:video_app/view/view_models/admin_video_control_vm.dart';

class AdminVideoControl extends StatefulWidget {
  final String subject;
  const AdminVideoControl({Key? key, required this.subject}) : super(key: key);

  @override
  _AdminVideoControlState createState() => _AdminVideoControlState();
}

class _AdminVideoControlState extends State<AdminVideoControl> {
  late AdminControlVideoViewModel _adminControlVideoViewModel;
  @override
  void initState() {
    _adminControlVideoViewModel=getIt<AdminControlVideoViewModel>();
    _adminControlVideoViewModel.loadVideo(widget.subject);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('الفيديوهات',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 26,right: 21,left: 21),
          child: ChangeNotifierProvider.value(
            value: _adminControlVideoViewModel,
            child: Consumer<AdminControlVideoViewModel>(
              builder: (context, value, child) =>
                  Column(
                      children: _adminControlVideoViewModel.videos.map((subjectv) {
                        return SubjectCard('assets/algebra.jpg',subjectv.subjectName , Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('',
                                  style: TextStyle(color: Color(0xff0369CD)),),
                                Text(subjectv.unitName,
                                    style: TextStyle(color: Color(0xff0369CD))),
                                Text('', style: TextStyle(color: Color(0xff0369CD))),
                                Text(subjectv.lessonName,
                                    style: TextStyle(color: Color(0xff0369CD))),
                                Text(subjectv.downloaded.toString().split(' ')[0],
                                    style: TextStyle(color: Color(0xff0369CD))),
                                TextButton(onPressed: (){
                                  _adminControlVideoViewModel.remove(subjectv.id);
                                  _adminControlVideoViewModel.loadVideo(widget.subject);

                                }, child: Text('مسح',style: TextStyle(color: Colors.white),),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.red
                                  ),)

                              ],
                            )
                          );
                      }
                      ).toList()
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
