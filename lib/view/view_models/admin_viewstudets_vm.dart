import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/student.dart';

@injectable
class ControlStudent extends ChangeNotifier{
  Database _database;
  StreamController onAdded = StreamController();
  List<Student> registeredStudents=[];
  List<Student> requestStudents=[];

  ControlStudent(this._database);
  loadActive() async {
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    List st=await studentsCollection.find({'type': 'student', 'active': 'true'}).toList();
    registeredStudents = st.map((model) =>
        Student.fromJson(model)).toList();

    onAdded.add('done');
    notifyListeners();
  }
  loadRequests() async {
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    List st=await studentsCollection.find({'type': 'student', 'active': 'false'}).toList();
    requestStudents= st.map((model) =>
        Student.fromJson(model)).toList();
    onAdded.add('done');
    notifyListeners();
  }
  acceptStudent(ObjectId id,String date,String startChosen,context,List<String> subjects){
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    studentsCollection.updateOne({
      '_id': id,},modify.set('active', 'true')) ;
    studentsCollection.updateOne({
      '_id': id,},modify.set('end_date', date)) ;
    if(startChosen!='not Chosen'){
      studentsCollection.updateOne({
        '_id': id,},modify.set('start_date', startChosen)) ;
    }
    studentsCollection.updateOne({
      '_id': id,},modify.set('subjects', subjects)) ;
    notifyListeners();

  }
  cancelStudent(ObjectId id){
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    studentsCollection.deleteOne({
      '_id': id,}) ;
    notifyListeners();
  }
}