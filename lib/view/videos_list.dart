import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/subject_card.dart';
import 'package:video_app/view/view_models/load_videos_vm.dart';
import 'package:provider/provider.dart';
import 'package:video_app/view/view_models/profile_vm.dart';


class ListVideos extends StatefulWidget {
  final String search;
  const ListVideos({Key? key, required this.search,}) : super(key: key);

  @override
  _ListVideosState createState() => _ListVideosState();
}

class _ListVideosState extends State<ListVideos> {
  late LoadVideosViewModel _loadVideosViewModel;
  late ProfileViewModel _profileViewModel;
  @override
  void initState() {
    _profileViewModel=getIt<ProfileViewModel>();
    _loadVideosViewModel=getIt<LoadVideosViewModel>();
    _loadVideosViewModel.loadVideo(widget.search,_profileViewModel.student.grade,
        _profileViewModel.student.startDate,_profileViewModel.student.endDate);
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
          value: _loadVideosViewModel,
          child: Consumer<LoadVideosViewModel>(
            builder: (context, value, child) =>
             Column(
              children: _loadVideosViewModel.videos.map((subject) {
                return
                  InkWell(onTap: (){

                    _loadVideosViewModel.
                    controlWatchTimes(subject,_profileViewModel.student.id,context,subject.link);

                    },
                    child: SubjectCard('assets/algebra.jpg',subject.subjectName , Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('',
                          style: TextStyle(color: Color(0xff0369CD)),),
                        Text(subject.unitName,
                            style: TextStyle(color: Color(0xff0369CD))),
                        Text('', style: TextStyle(color: Color(0xff0369CD))),
                        Text(subject.lessonName,
                            style: TextStyle(color: Color(0xff0369CD))),

                      ],
                    )),
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
