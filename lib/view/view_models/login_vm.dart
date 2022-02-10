
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/student.dart';

@injectable
class LoginViewModel {
  Database _database;
  StreamController onLogged = StreamController();
  StreamController onLoggedError = StreamController();

  StreamController onLoggedAdmin = StreamController();

  LoginViewModel(this._database);
  login(String phone,String password) async {
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    Map<String, dynamic>? st=await studentsCollection.findOne({'email': '$phone', 'password': '$password'});
    if(st!=null) {

      Student student = Student.fromJson(st);
      if(student.type=='admin'){
        onLoggedAdmin.add('ee');
      }else{
        if(student.endDate!=''){
          DateTime end=DateTime.parse(student.endDate);
          DateTime now=DateTime.parse(DateTime.now().toString().split(' ')[0]);
          if(student.active=='true'&&end.isAfter(now)){

            SharedPreferences prefs = await SharedPreferences.getInstance();
            String user = jsonEncode(student.toJSON());
            prefs.setString('userData', user);
            onLogged.add('ee');
          }else{
            // studentsCollection.deleteOne({'_id':student.id});
            onLoggedError.add('ee');
          }
        }else{
          onLoggedError.add('ee');

        }
      }
    }else{
      onLoggedError.add('ee');
    }

  }
}