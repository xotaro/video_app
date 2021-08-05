import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/adding_video_screen.dart';
import 'package:video_app/view/subject_info_card.dart';
import 'package:video_app/view/view_models/load_videos_vm.dart';

class AdminAddCourse extends StatefulWidget {
  const AdminAddCourse({Key? key}) : super(key: key);

  @override
  _AdminAddCourseState createState() => _AdminAddCourseState();
}

class _AdminAddCourseState extends State<AdminAddCourse> {
  late LoadVideosViewModel _loadVideosViewModel;
  @override
  void initState() {
    _loadVideosViewModel=getIt<LoadVideosViewModel>();
    _loadVideosViewModel.loadContent();
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
        title: Text('المقاطع',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),
      ),
      body: ChangeNotifierProvider.value(
        value: _loadVideosViewModel,
        child: SingleChildScrollView(
          child: Consumer <LoadVideosViewModel>(
            builder: (context, value, child) {
             return Padding(
                padding: EdgeInsets.only(left: 26,right: 27,top: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:
                    _loadVideosViewModel.contents.map((e) => SubjectInfo(e.id[0], '${e.totalWatched}', '${e.total}')).toList()

                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                Directionality(textDirection: TextDirection.rtl, child: AddingVideo())),
          );        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
