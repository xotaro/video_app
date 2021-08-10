// final SharedPreferences prefs = await SharedPreferences.getInstance();
// final String userStr = prefs.getString('userData')!;
// print(userStr);


import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/models/video.dart';

@injectable
class AdminContentViewerViewModel extends ChangeNotifier{
  Database _database;
  int videoNumber=0;int inactive=0;int active=0;
  List<Video> latest=[];
  AdminContentViewerViewModel(this._database);
  loadAdminContent() async {
    Db _db=_database.db;

    DbCollection studentCollection=_db.collection('Students');
    DbCollection videosCollection=_db.collection('videos');

     videoNumber=await videosCollection.count({});
     inactive=await studentCollection.count({'active':'false','type':'student'});
     active=await studentCollection.count({'active':'true','type':'student'});
    List vs=await videosCollection.modernFind(sort: {'downloaded':-1}).toList();
    List<Video> vid=vs.map((model) =>
        Video.fromJson(model)).toList();

    latest=vid.take(3).toList();

    notifyListeners();
  }

}