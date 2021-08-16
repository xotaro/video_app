import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/video.dart';

@injectable
class AdminControlVideoViewModel extends ChangeNotifier{
  Database _database;
  List<Video> videos=[];
  AdminControlVideoViewModel(this._database);
  loadVideo(String subjectName) async {
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    List st=await videosCollection.find({'subjectName': '$subjectName',}).toList();
    List<Video> beforeFilter = st.map((model) =>
        Video.fromJson(model)).toList();

    videos=beforeFilter;

    notifyListeners();
  }
  remove(ObjectId id){
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    DbCollection st_vide=_db.collection('st_vide');

    videosCollection.deleteOne({
      '_id': id,}) ;
    st_vide.deleteMany({
      'video': id,}) ;
    notifyListeners();
  }
}