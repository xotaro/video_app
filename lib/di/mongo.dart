
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';

@singleton
class Database {
  Db db=new Db('');
  Database() {
    Db.create(
    'mongodb+srv://123456:12345699@cluster0.cd0ay.mongodb.net/Video_app?retryWrites=true&w=majority')
        .then((value) {
          db=value;
          db.open();
          print('connected');
    });

  }

}
