import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/videos_student.dart';

@injectable
class ControlStudentViewModel extends ChangeNotifier{
  Database _database;

  ControlStudentViewModel(this._database);
  List<VideoStudent> watchedVideosByStudent=[];
  bool show=false;

  loadWatchedVideos(ObjectId id)  async {
    Db _db=_database.db;
    DbCollection watchedVideosCollection=_db.collection('st_vide');
    List watched=await watchedVideosCollection.find({'student': id,}).toList();
    watchedVideosByStudent = watched.map((model) =>
        VideoStudent.fromJson(model)).toList();
    notifyListeners();
  }
  addWatchValue(ObjectId studentId,ObjectId videoId)  async {
    Db _db=_database.db;
    DbCollection watchedVideosCollection=_db.collection('st_vide');
    Map watched=(await watchedVideosCollection.findOne({'video':videoId,'student': studentId}))!;
    VideoStudent v = VideoStudent.fromJson(watched);
    if(v.watched<3){
      int neww=v.watched++;
      watchedVideosCollection.updateOne({'video':videoId,'student':studentId}, modify.set('watched',v.watched++));
    }
    notifyListeners();
  }
  cancelStudent(ObjectId id){
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    DbCollection st_vide=_db.collection('st_vide');

    studentsCollection.deleteOne({
      '_id': id,}) ;
    studentsCollection.deleteMany({
      'student': id,}) ;
    notifyListeners();
  }
}