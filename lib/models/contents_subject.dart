class SubjectContent{
  List id;
  int total;
  int totalWatched;

  SubjectContent(this.id,this.total,this.totalWatched,);
  SubjectContent.fromJson(Map json)
      : id = json['_id'],
        total = json['total'],
        totalWatched = json['totalWatched']



  ;

}