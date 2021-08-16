

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/models/contents_subject.dart';
import 'package:video_app/models/video.dart';
import 'package:video_app/models/videos_student.dart';

import '../video_viewer.dart';

@injectable
class LoadVideosViewModel extends ChangeNotifier{
  Database _database;
  ReplaySubject watch = ReplaySubject(maxSize: 1);
  ReplaySubject warning = ReplaySubject(maxSize: 1);
  List<Video> videos=[];
  List<SubjectContent> adminContents=[];
  List<SubjectContent> studentContents=[];

  LoadVideosViewModel(this._database);
  loadVideo(String subjectName,int grade,String start,String end ) async {
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    List st=await videosCollection.find({'subjectName': '$subjectName', 'grade': grade,}).toList();
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
  loadContent() async {
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    DbCollection vd_st=_db.collection('st_vide');

    final pipeline=AggregationPipelineBuilder().addStage(
        Group(
            id: Field('subjectName'),
            
            fields: {
              'total': Sum(1),
              'totalWatched': Sum(Field('watched'))

            }

        )
    ).addStage(
        Sort(
            {
              '_id':-1

            }
        )
    ).build();
    final pipeline2=AggregationPipelineBuilder().addStage(
        Group(
            id: Field('subjectName'),

            fields: {
              'total': Sum(1),
              'totalWatched': Sum(Field('watched'))

            }

        )

    ).addStage(
        Sort(
            {
              '_id':-1

            }
        )
    )
        .build();


    List result=await videosCollection.aggregateToStream(pipeline).toList();

    List<SubjectContent> modify = result.map((model) =>
        SubjectContent.fromJson(model)).toList();

    List result2=await vd_st.aggregateToStream(pipeline2).toList();

    List<SubjectContent> modify2=result2.map((e) => SubjectContent.fromJson(e)
    ).toList();
    List<SubjectContent> finale=[];

    modify.forEach((element) async {
        modify2.forEach((element2) {
          if(element.id==element2.id){
            element.totalWatched=element2.totalWatched;
          }
        });
        finale.add(element);

    });
    adminContents=finale;
    notifyListeners();
  }
  loadStudentContent(int grade,List subjects,ObjectId student) async {
    Db _db=_database.db;
    DbCollection videosCollection=_db.collection('videos');
    DbCollection vd_st=_db.collection('st_vide');
    List<SubjectContent> finale=[];

      final pipeline=AggregationPipelineBuilder().addStage(
          Match(
              (where.oneFrom('subjectName', subjects ).map['\$query'])
          )
      ).addStage(
          Group(
              id: Field('subjectName'),
              fields: {
                'total': Sum(1),
                'totalWatched': Sum(Field('watched'))

              }

          )

      ).addStage(
          Sort(
              {
                '_id':-1

              }
          )
      ).build();
      final pipeline2=AggregationPipelineBuilder().addStage(
          Match(
              {'student':student}
          )
      ).addStage(
          Group(
              id: Field('subjectName'),

              fields: {
                'total': Sum(1),
                'totalWatched': Sum(Field('watched'))

              }

          )

      ).addStage(
          Sort(
              {
                '_id':-1

              }
          )
      )
          .build();

      List result=await videosCollection.aggregateToStream(pipeline).toList();
      List<SubjectContent> modify=result.map((e) => SubjectContent.fromJson(e)
      ).toList();
      List result2=await vd_st.aggregateToStream(pipeline2).toList();

      List<SubjectContent> modify2=result2.map((e) => SubjectContent.fromJson(e)
      ).toList();


      modify.forEach((element) async {
        int index=modify.indexOf(element );
        if(index<modify2.length){
          element.totalWatched=modify2[index].totalWatched;
          finale.add(element );
        }else{
          finale.add(element );
        }
      });


    studentContents=finale;
    notifyListeners();
  }
  controlWatchTimes(Video video,ObjectId studentId,context,String link) async {
    Db _db=_database.db;
    DbCollection studentVideoCollection=_db.collection('st_vide');
    Map<String,dynamic>? studentVideo=await studentVideoCollection.findOne({'video':video.id,'student':studentId});

    if(studentVideo==null){
      studentVideoCollection.insertOne({'video': video.id,'subjectName':video.subjectName,
        'unitName':video.unitName , 'lessonName':video.lessonName,'student': studentId, 'watched':1
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
            Directionality(textDirection: TextDirection.rtl,
                child: VideoApp( link:link,)
            )
        ),
      );
    }else{

      VideoStudent watched= VideoStudent.fromJson(studentVideo);
      int w=watched.watched;
      if(w<=3){
        w=w+1;
        studentVideoCollection.updateOne({'video':video.id,'student':studentId}, modify.set('watched',w));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              Directionality(textDirection: TextDirection.rtl,
                  child: VideoApp( link:link,)
              )
          ),
        );
      }else{
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('عدد المشاهدات',textAlign: TextAlign.right,),
              content: const Text('لقد استنفذت عدد المشاهدات',textAlign: TextAlign.right,),
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
      }
    }

  }

}