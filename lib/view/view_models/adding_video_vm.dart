import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';

@injectable
class AddVideoViewModel{
  Database _database;
  StreamController onAdded = StreamController();
  AddVideoViewModel(this._database);
  addNew(String subjectName,String unitName,String lessonName,String link,int grade,String link2){
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    List<String> now =DateTime.now().toString().split(' ');
    DateTime downloaded=DateTime.parse(now[0]).add(Duration(hours: 2));
    videosCollection.insertOne({'subjectName': '$subjectName', 'unitName': '$unitName',
      'lessonName': '$lessonName', 'link': '$link','grade':2,'downloaded':downloaded,'linkLD': '$link2'
    });
    onAdded.add('done');
  }
}