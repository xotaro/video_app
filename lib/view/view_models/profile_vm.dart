// final SharedPreferences prefs = await SharedPreferences.getInstance();
// final String userStr = prefs.getString('userData')!;
// print(userStr);


import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_app/models/student.dart';

@singleton
class ProfileViewModel extends ChangeNotifier{
  late Student student;
  bool show=false;
  StreamController loaded= StreamController.broadcast();

  loadData() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String userStr = prefs.getString('userData')!;
     Map<dynamic, dynamic> userMap = jsonDecode(userStr) as Map<dynamic, dynamic>;
     final id=ObjectId.fromHexString(userMap['_id']);
     userMap['_id']=id;
     student=Student.fromJson(userMap);
     show=true;
     loaded.add('event');
    notifyListeners();
  }
}