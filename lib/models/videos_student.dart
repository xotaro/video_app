import 'package:mongo_dart/mongo_dart.dart';

class VideoStudent{
  ObjectId videoId;
  String subjectName;
  String unitName;
  String lessonName;
  int watched;

  VideoStudent(this.videoId,this.subjectName,this.unitName,this.lessonName,this.watched,);
  VideoStudent.fromJson(Map json)
      :    videoId = json['video'],
      subjectName = json['subjectName'],
        unitName = json['unitName'],
        lessonName = json['lessonName'],
        watched = json['watched']



  ;

}