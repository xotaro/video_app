import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CustomInfoCard(double right,double left, Icon icon,String title,String info){
  return                   Flexible(
      child:Padding(
        padding:EdgeInsets.only(right: right,left: left),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7)
              ,boxShadow: [
            BoxShadow(
                color: Color(0xff848484),
                blurRadius: 10
            )
          ]),
          child: ListTile(
            title:  icon,
            subtitle: Column(
              children: [
                Text(title,style: TextStyle(color: Colors.black,fontSize: 12),),
                Text(info,style: TextStyle(color: Colors.black,fontSize: 12),),
              ],
            ),
          ),
        ),
      )
  );

}