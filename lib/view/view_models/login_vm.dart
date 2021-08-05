
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/student.dart';

@injectable
class LoginViewModel {
  Database _database;
  StreamController onLogged = StreamController();
  StreamController onLoggedAdmin = StreamController();

  LoginViewModel(this._database);
  login(String phone,String password) async {
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    Map<String, dynamic>? st=await studentsCollection.findOne({'phone_number': '$phone', 'password': '$password'});
    Student student = Student.fromJson(st!);
    if(student.type=='admin'){
      onLoggedAdmin.add('ee');
    }else{
      if(student.active=='true'){
        onLogged.add('ee');
      }
    }
  }
}