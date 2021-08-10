import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/subject_info_card.dart';
import 'package:video_app/view/videos_list.dart';
import 'package:video_app/view/view_models/load_videos_vm.dart';
import 'package:video_app/view/view_models/profile_vm.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  _SubjectsState createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  late LoadVideosViewModel _loadVideosViewModel;
  late ProfileViewModel _profileViewModel;

  @override
  void initState() {
    // TODO: implement initState
    _loadVideosViewModel=getIt<LoadVideosViewModel>();
    _profileViewModel=getIt<ProfileViewModel>();

    _loadVideosViewModel.loadStudentContent(_profileViewModel.student.grade,_profileViewModel.student.id);
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
        title: Text('المواد',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),
      ),
      body: ChangeNotifierProvider.value(
        value: _loadVideosViewModel,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 26,right: 27,top: 10),
            child: Consumer<LoadVideosViewModel>(
              builder: (context, value, child) =>
                  _loadVideosViewModel.studentContents.isEmpty?Center(
                    child: Text('لايوجد مقاطع في الوقت الحالي',style: TextStyle(fontSize: 20),)
                  ):Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                  _loadVideosViewModel.studentContents.map((e) {
                   return InkWell(
                      child: SubjectInfo(e.id,'${e.totalWatched}','${e.total}',),
                      onTap: () async {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              Directionality(textDirection: TextDirection.rtl, child: ListVideos(search: e.id,)
                              )
                          ),
                        );

                      },

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
