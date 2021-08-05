import 'package:mongo_dart/mongo_dart.dart';

class Student{
  ObjectId id;
  String name;
  String phone;
  String parent;
  String email;
  String password;
  String active;
  String type;
  Student(this.id,this.name,this.phone,this.parent,this.password,this.email,this.active,this.type);
  Student.fromJson(Map json)
      : id = json['_id'],
        name = json['name'],
        phone = json['phone_number'],
        parent = json['parent_number'],
        email = json['email'],
        password = json['password'],
        active = json['active'],
        type = json['type']



  ;

}