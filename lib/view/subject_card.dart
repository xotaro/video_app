import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SubjectCard(String path,String title,Widget subtitle){
  return  Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: Container(
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
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 22),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(path,fit: BoxFit.contain,scale:2,),

            ),
          ) ,
          Expanded(
            child: ListTile(
                contentPadding: EdgeInsets.only(right: 23),
                isThreeLine: true,
                title: Text(title,style: TextStyle(color: Colors.black,fontSize: 14),),
                subtitle: subtitle
            ),
          )
        ],
      ),
    ),
  );

}