class Video{
  String subjectName;
  String unitName;
  String lessonName;
  String link;

  Video(this.subjectName,this.unitName,this.lessonName,this.link,);
  Video.fromJson(Map json)
      : subjectName = json['subjectName'],
        unitName = json['phone_number'],
        lessonName = json['lessonName'],
        link = json['link']



  ;

}