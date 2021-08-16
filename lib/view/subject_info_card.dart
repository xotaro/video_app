import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/videos_list.dart';

Widget SubjectInfo(String subjectName,String views,String videos){
  return
Column(
  children: [
    Padding(
      padding: EdgeInsets.only(bottom: 23),
      child: InkWell(

        child: Container(
          padding: EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                    color: Color(0xff848484),
                    blurRadius: 10

                )
              ]
          ),
          child: Center(
              child: Column(
                children: [
                  Image.asset('assets/algebra.jpg',scale: 2,),
                  Center(child: Text(subjectName,style: TextStyle(fontSize: 14,color: Colors.black),))
                  ,
                ],
              )

          ),
        ),
      ),
    ),
    Padding(padding: EdgeInsets.only(bottom: 25),
      child: Wrap(
        direction: Axis.horizontal,
        runSpacing: 10,
        spacing: 42,
        children: [
          Chip(
            avatar: Icon(Icons.videocam_sharp, color: Color(0xff0369CD)),
            label:
            Column(
              children: [
                Text('عدد المقاطع:'),
                Text(videos),
              ],
            ),
            backgroundColor: Colors.white,
            shadowColor:Color(0xff848484),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
            ),
            elevation: 5,
            labelPadding: EdgeInsets.only(left: 24,right: 25),

          ),
          Chip(
            avatar: Icon(Icons.remove_red_eye, color: Color(0xff0369CD)),
            label:
            Column(
              children: [
                Text('المشاهدات:'),
                Text(views),
              ],
            ),
            backgroundColor: Colors.white,
            shadowColor:Color(0xff848484),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7)
            ),
            elevation: 5,
            labelPadding: EdgeInsets.only(left: 24,right: 25),
          ),
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(7),
          //         boxShadow: [
          //           BoxShadow(
          //               color: Color(0xff848484),
          //               blurRadius: 10
          //
          //           )
          //         ]
          //     ),
          //     child: ListTile(
          //       title: Text('عدد المقاطع'),
          //       subtitle: Text('6'),
          //       leading: Icon(Icons.videocam_sharp, color: Color(0xff0369CD)),
          //     ),
          //   ),
          // ),
          // SizedBox(width: 20,),
          // Expanded(
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(7),
          //         boxShadow: [
          //           BoxShadow(
          //               color: Color(0xff848484),
          //               blurRadius: 10
          //
          //           )
          //         ]
          //     ),
          //     child: ListTile(
          //       contentPadding: EdgeInsets.zero,
          //       title: Text('المشاهدات'),
          //       subtitle: Text('6/12'),
          //       leading: Icon(Icons.remove_red_eye, color: Color(0xff0369CD)),
          //     ),
          //   ),
          // )

        ],
      ),)
  ],
) ;
}