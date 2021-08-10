import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/card_info.dart';
import 'package:video_app/view/profile.dart';
import 'dart:math' as math;

import 'package:video_app/view/subject_card.dart';
import 'package:video_app/view/view_models/profile_vm.dart';
import 'package:video_app/view/view_models/student_content_viewer.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({Key? key}) : super(key: key);

  @override
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  late ProfileViewModel _profileViewModel;
  late StudentContentViewerViewModel _studentContentViewerViewModel;
@override
  void initState() {
    // TODO: implement initState
  _profileViewModel=getIt<ProfileViewModel>();
  _studentContentViewerViewModel=getIt<StudentContentViewerViewModel>();
  _profileViewModel.loadData();
  _profileViewModel.loaded.stream.listen((event) {
    _studentContentViewerViewModel.loadAStudentContent(_profileViewModel.student.grade );

  });
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
           value: _profileViewModel,
          ),
          ChangeNotifierProvider.value(
            value: _studentContentViewerViewModel,
          ),
        ],
    child: Consumer<ProfileViewModel>(
        builder: (context, value, child) {
          return _profileViewModel.show?Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 65),
                child:Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 23,left: 23),
                      child: SizedBox(
                        width: double.infinity,
                        height: 131,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(18))),
                          color: Color(0xff328CE5),
                          child: Padding(
                            padding: EdgeInsets.only(top: 41),
                            child: Consumer<ProfileViewModel>(
                              builder: (context, value, child) =>Column(
                                children: [

                                  Text(
                                    _profileViewModel.student.name,
                                    style: TextStyle(color: Colors.white,fontSize: 18),
                                  ),
                                  Text(
                                    _profileViewModel.student.grade==2?'الصف الثالث ثانوي':'الصف الثاني ثانوي',
                                    style: TextStyle(color: Colors.white,fontSize: 12),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                   Consumer<StudentContentViewerViewModel>(
                     builder: (context, value, child) =>
                     Flexible(
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Padding(
                             padding: EdgeInsets.only(left: 29, right: 24,top: 33,bottom: 31),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               mainAxisSize: MainAxisSize.max,
                               children: [
                                 CustomInfoCard(0, 24, Icon(Icons.menu_book_outlined, color: Color(0xff0369CD),), "عدد المواد:", '${_studentContentViewerViewModel.subjects}',12),
                                 CustomInfoCard(0, 0, Icon(Icons.videocam_sharp, color: Color(0xff0369CD)), "عدد المقاطع:", '${_studentContentViewerViewModel.videoNumber}',12),
                               ],
                             ),
                           ),
                           ListTile(
                             contentPadding: EdgeInsets.only(right: 20),
                             horizontalTitleGap: 0,
                             leading: Transform.rotate(
                               angle: 180 * math.pi / 180,
                               child: IconButton(
                                 icon: Icon(
                                   Icons.info_outline,
                                   color:Color(0xff0369CD),
                                 ),
                                 onPressed: null,
                               ),
                             ),
                             title: Text('أحدث المقاطع المنزله :',style: TextStyle(color: Colors.black,fontSize: 18),),
                           ),
                           Divider(
                             color: Color(0xffC4C4C4),
                             thickness: 1.5,
                           ),
                           Expanded(
                             child: SingleChildScrollView(
                               child: Padding(
                                 padding: EdgeInsets.only(top: 23,right: 26,left: 16),
                                 child: Column(
                                   children:
                                   _studentContentViewerViewModel.latest.map((e) =>
                                       SubjectCard('assets/algebra.jpg', e.subjectName, Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(e.unitName,style: TextStyle(color: Color(0xff0369CD)),),
                                           Text('',style: TextStyle(color: Color(0xff0369CD))),
                                           Text(e.lessonName,style: TextStyle(color: Color(0xff0369CD))),

                                         ],
                                       )),
                                   ).toList()
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   )
                  ],
                ),
              ),

            ) :Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                LinearProgressIndicator(),
              ],
            ),
          );
        },
    ),)
    ;
  }
}
