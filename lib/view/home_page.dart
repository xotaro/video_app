import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/card_info.dart';
import 'dart:math' as math;

import 'package:video_app/view/subject_card.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({Key? key}) : super(key: key);

  @override
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Column(
                        children: [
                          Text(
                            'احمد طاهر عبد السلام',
                            style: TextStyle(color: Colors.white,fontSize: 18),
                          ),
                          Text(
                            'الصف الثالث ثانوي',
                            style: TextStyle(color: Colors.white,fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 29, right: 24,top: 33,bottom: 31),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomInfoCard(0, 24, Icon(Icons.menu_book_outlined, color: Color(0xff0369CD),), "عدد المواد:", '2',12),
                    CustomInfoCard(0, 0, Icon(Icons.videocam_sharp, color: Color(0xff0369CD)), "عدد المقاطع:", '8',12),
                    CustomInfoCard(24, 0, Icon(Icons.remove_red_eye, color: Color(0xff0369CD)), 'المشاهدات:', '12/22',12)
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
