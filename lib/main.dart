import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/core/client.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/view/home_navigate.dart';
import 'package:video_app/view/home_page.dart';
import 'package:video_app/view/login_page.dart';
import 'di/di_config.dart';
import 'view/login_page.dart';
import 'view/admin_navigation.dart';

void main() async {
  configureDependencies();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home:Directionality(textDirection: TextDirection.rtl,child:LoginPage() )

       /* ( // add this
        textDirection: TextDirection.rtl, // set this property
       // child: LoginPage(),
        child: HomeNavigate(),
      ),*/
    );
  }
}
