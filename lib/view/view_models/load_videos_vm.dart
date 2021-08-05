
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/contents_subject.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/models/video.dart';
import 'package:video_app/view/videos_list.dart';

@injectable
class LoadVideosViewModel extends ChangeNotifier{
  Database _database;
  StreamController onload = StreamController();
  StreamController onLoggedAdmin = StreamController();
  List<Video> videos=[];
  List<SubjectContent> contents=[];
  LoadVideosViewModel(this._database);
  loadVideo(String subjectName,String unitName) async {
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    List st=await videosCollection.find({'subjectName': '$subjectName', 'phone_number': '$unitName'}).toList();
    videos = st.map((model) =>
        Video.fromJson(model)).toList();
   notifyListeners();
  }
  loadContent() async {
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    final pipeline=AggregationPipelineBuilder().addStage(
        Group(
            id: [Field('subjectName')],
            
            fields: {
              'total': Sum(1),
              'totalWatched': Sum(Field('watched'))

            }

        )
    ).build();
    List result=await videosCollection.aggregateToStream(pipeline).toList();
    contents = result.map((model) =>
        SubjectContent.fromJson(model)).toList();
    notifyListeners();
  }
}