
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';

@singleton
class Database {
  StreamController dbReady = StreamController();
  StreamController dbErrorSocket = StreamController();

  Db db=new Db('');
  Database() {

    Db.create(
    'mongodb+srv:/')
        .then((value) {
          db=value;
          db.open();
          dbReady.add('event');
    }).catchError((e){
      if(e.runtimeType.toString()=='SocketException'){
        print(e);
        dbErrorSocket.add('e');
      }
    });

  }

}
