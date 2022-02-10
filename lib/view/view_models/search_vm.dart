import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/models/video.dart';

@injectable
class SearchViewModel extends ChangeNotifier{
  Database _database;
  List<Student> searchedStudents=[];
  List<Video> videos=[];

  SearchViewModel(this._database);
  loadSearched(String name) async {
    Db _db=_database.db;
    DbCollection studentsCollection=_db.collection('Students');
    List st=await studentsCollection.find(where.match('name','^$name').and(where.eq('active', 'true')).and(where.eq('type', 'student')), ).toList();
    searchedStudents = st.map((model) =>
        Student.fromJson(model)).toList();

    notifyListeners();
  }
  loadSearchedVideos(String start,String end,String sName,String lName) async {
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    List st=await videosCollection.find(where.match('lessonName','^.*$lName.*\$').and(where.eq('subjectName', '$sName')), ).toList();
    List<Video> beforeFilter = st.map((model) =>
        Video.fromJson(model)).toList();
    DateTime startTime=DateTime.parse(start);
    DateTime endTime=DateTime.parse(end);
    beforeFilter.removeWhere((element) => element.downloaded.isBefore(startTime) ||
        element.downloaded.isAfter(endTime)
    );
    videos=beforeFilter;

    notifyListeners();
  }
}