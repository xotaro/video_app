import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/subject_card.dart';
import 'package:video_app/view/view_models/load_videos_vm.dart';
import 'package:video_app/view/view_models/profile_vm.dart';
import 'package:video_app/view/view_models/search_vm.dart';


class SearchPageVideo extends StatefulWidget {
  final subject;
  const SearchPageVideo({Key? key, this.subject}) : super(key: key);

  @override
  _SearchPageVideoState createState() => _SearchPageVideoState();
}

class _SearchPageVideoState extends State<SearchPageVideo> {
  late SearchViewModel _searchViewModel;
  TextEditingController nameController=TextEditingController();
  late LoadVideosViewModel _loadVideosViewModel;
  late ProfileViewModel _profileViewModel;
  @override
  void initState() {
    _searchViewModel=getIt<SearchViewModel>();
      _profileViewModel=getIt<ProfileViewModel>();
    _loadVideosViewModel=getIt<LoadVideosViewModel>();
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
                hintText:"اسم الدرس هنا",
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
              _searchViewModel.loadSearchedVideos(_profileViewModel.student.startDate,_profileViewModel.student.endDate,
              widget.subject,s);
            }
        ),
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 26,right: 21,left: 21),
          child: ChangeNotifierProvider.value(
            value: _searchViewModel,
            child: Consumer<SearchViewModel>(
              builder: (context, value, child) =>
                  Column(
                      children: _searchViewModel.videos.map((subject) {
                        return
                          SubjectCard('assets/algebra.jpg',subject.subjectName , Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('',
                                style: TextStyle(color: Color(0xff0369CD)),),
                              Text(subject.unitName,
                                  style: TextStyle(color: Color(0xff0369CD))),
                              Text('', style: TextStyle(color: Color(0xff0369CD))),
                              Text(subject.lessonName,
                                  style: TextStyle(color: Color(0xff0369CD))),
                              Wrap(
                                spacing: 5,
                                children: [
                                  subject.link!=null&&subject.link!=''? InkWell(
                                    onTap: (){
                                      _loadVideosViewModel.
                                      controlWatchTimes(subject,_profileViewModel.student.id,context,subject.link);
                                    },
                                    child: Chip(
                                      label: Text('جودة مرتفعه',style: TextStyle(color: Colors.white,fontSize: 16),),backgroundColor: Color(0xff0369CD),
                                      shadowColor:Color(0xff848484),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7)
                                      ),
                                      elevation: 5,),
                                  ):Container(),
                                  subject.linkLD!=null&&subject.linkLD!=''? InkWell(
                                    onTap: (){
                                      _loadVideosViewModel.
                                      controlWatchTimes(subject,_profileViewModel.student.id,context,subject.linkLD!);

                                    },
                                    child: Chip(label: Text('جودة متوسطه',style: TextStyle(color: Colors.white,fontSize: 16),),backgroundColor: Color(0xff0369CD),
                                      shadowColor:Color(0xff848484),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7)
                                      ),
                                      elevation: 5,),
                                  ):Container()
                                ],
                              )

                            ],
                          )
                          );

                      }).toList()
                  ),
            ),
          ),
        ),
      ),

    );
  }
}
