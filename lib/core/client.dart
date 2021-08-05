
import 'package:injectable/injectable.dart';
import 'package:mongo_dart/mongo_dart.dart';

@injectable
class Client{
  Db _database;
  Client(this._database);
  connect(){
    _database.open();
    print('connected');
  }



}