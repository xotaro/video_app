import 'package:mongo_dart/mongo_dart.dart';

class Video{
  ObjectId id;
  String subjectName;
  String unitName;
  String lessonName;
  String link;
  DateTime downloaded;

  Video(this.id,this.subjectName,this.unitName,this.lessonName,this.link,this.downloaded);
  Video.fromJson(Map json)
      : id=json['_id'],
        subjectName = json['subjectName'],
        unitName = json['unitName'],
        lessonName = json['lessonName'],
        link = json['link'],
        downloaded = json['downloaded']




  ;

}