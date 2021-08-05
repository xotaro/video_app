import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';

@injectable
class AddVideoViewModel{
  Database _database;
  StreamController onAdded = StreamController();
  AddVideoViewModel(this._database);
  addNew(String subjectName,String unitName,String lessonName,String link){
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    videosCollection.insertOne({'subjectName': '$subjectName', 'unitName': '$unitName', 'lessonName': '$lessonName',
      'link': '$link'

    });
    onAdded.add('done');
  }
}