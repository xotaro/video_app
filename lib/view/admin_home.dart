import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/card_info.dart';
import 'dart:math' as math;

import 'package:video_app/view/subject_card.dart';
import 'package:video_app/view/view_models/content_viewer_vm.dart';
import 'package:video_app/view/view_models/profile_vm.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late AdminContentViewerViewModel _adminContentViewerViewModel;

  @override
  void initState() {
    _adminContentViewerViewModel=getIt<AdminContentViewerViewModel>();
    _adminContentViewerViewModel.loadAdminContent();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _adminContentViewerViewModel,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 65),
          child:Consumer<AdminContentViewerViewModel>(
            builder: (context, value, child) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 130,left: 130,bottom: 28),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                        'assets/logo.png'
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29, right: 24,top: 33,bottom: 31),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomInfoCard(0, 17, Icon(Icons.videocam_sharp, color: Color(0xff0369CD)), "عدد المقاطع:", '${_adminContentViewerViewModel.videoNumber}',11),
                      CustomInfoCard(0, 0, Icon(Icons.note_add_rounded, color: Color(0xff0369CD),), "طلبات التسجيل:", '${_adminContentViewerViewModel.inactive}',11),
                      CustomInfoCard(17, 0, Icon(Icons.people, color: Color(0xff0369CD)),"الطلاب المسجلين:" , '${_adminContentViewerViewModel.active}',11)
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
                      child: _adminContentViewerViewModel.latest.isEmpty?Text('لا يوجد الى الان'):
                      Column(
                        children:
                        _adminContentViewerViewModel.latest.map((e) =>

                            SubjectCard('assets/algebra.jpg', e.subjectName, Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.unitName,style: TextStyle(color: Color(0xff0369CD)),),
                                Text("",style: TextStyle(color: Color(0xff0369CD))),
                                Text(e.lessonName,style: TextStyle(color: Color(0xff0369CD))),

                              ],
                            )),



                        ).toList()
                        ,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
