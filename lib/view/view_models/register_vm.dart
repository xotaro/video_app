
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';

@injectable
class RegisterViewModel{
  Database _database;
  StreamController onRegistered = StreamController();
  RegisterViewModel(this._database);
  registerNew(String name,String phoneNumber,String parentNumber,String email,String password){
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    studentsCollection.insertOne({'name': '$name', 'phone_number': '$phoneNumber', 'parent_number': '$parentNumber'
      , 'email': '$email', 'password': '$password', 'active': 'false','type':'student',

    });
    onRegistered.add('done');
  }
}