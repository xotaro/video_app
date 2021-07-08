import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/card_info.dart';
import 'dart:math' as math;

import 'package:video_app/view/subject_card.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 65),
        child:Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 23,left: 23),
              child: RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.pending,
                  color:Colors.blue ,
                  size: 100.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 29, right: 24,top: 33,bottom: 31),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  CustomInfoCard(0, 17, Icon(Icons.videocam_sharp, color: Color(0xff0369CD)), "عدد المقاطع:", '8',11),
                  CustomInfoCard(0, 0, Icon(Icons.note_add_rounded, color: Color(0xff0369CD),), "طلبات التسجيل:", '4',11),
                  CustomInfoCard(17, 0, Icon(Icons.remove_red_eye, color: Color(0xff0369CD)),"الطلاب المسجلين:" , '15',11)
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
                    children: [
                      SubjectCard('assets/algebra.jpg', 'الجبر', Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('الوحده الاولى ',style: TextStyle(color: Color(0xff0369CD)),),
                          Text('عنوان الوحده ',style: TextStyle(color: Color(0xff0369CD))),
                          Text("الدرس ",style: TextStyle(color: Color(0xff0369CD))),
                          Text('عنوان الدرس',style: TextStyle(color: Color(0xff0369CD))),

                        ],
                      )),
                      SubjectCard('assets/algebra.jpg', 'الجبر', Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('الوحده الاولى ',style: TextStyle(color: Color(0xff0369CD)),),
                          Text('عنوان الوحده ',style: TextStyle(color: Color(0xff0369CD))),
                          Text("الدرس ",style: TextStyle(color: Color(0xff0369CD))),
                          Text('عنوان الدرس',style: TextStyle(color: Color(0xff0369CD))),

                        ],
                      )),
                      SubjectCard('assets/algebra.jpg', 'الجبر', Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('الوحده الاولى ',style: TextStyle(color: Color(0xff0369CD)),),
                          Text('عنوان الوحده ',style: TextStyle(color: Color(0xff0369CD))),
                          Text("الدرس ",style: TextStyle(color: Color(0xff0369CD))),
                          Text('عنوان الدرس',style: TextStyle(color: Color(0xff0369CD))),

                        ],
                      ))

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
