
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';

@injectable
class RegisterViewModel{
  Database _database;
  StreamController onRegistered = StreamController();
  RegisterViewModel(this._database);
  registerNew(String name,String phoneNumber,String parentNumber,String email,String password,int grade,context) async {
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    List<String> now =DateTime.now().toString().split(' ');

    studentsCollection.findOne({'email':email}).then((value){
      if(value!=null){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('خطأ',textAlign: TextAlign.right,),
              content: const Text('هذا البريد مستعمل سابقاا',textAlign: TextAlign.right,),
              actions: [
                TextButton(
                  child: Text('حسنا'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }else{
        studentsCollection.insertOne({'name': '$name', 'phone_number': '$phoneNumber', 'parent_number': '$parentNumber'
          , 'email': '$email', 'password': '$password', 'active': 'false','type':'student','grade':grade,
          'start_date':now[0],'end_date':'','subjects':[]


        });
        onRegistered.add('done');

      }
    });

  }
}