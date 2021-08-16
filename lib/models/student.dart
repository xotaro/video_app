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
  String startDate;
  String endDate;
  List<dynamic> subjects;

  int grade;
  Student(this.id,this.name,this.phone,this.parent,
      this.password,this.email,this.active,
      this.type,this.startDate,this.endDate,this.grade,this.subjects);
  Student.fromJson(Map json)
      : id = json['_id'],
        name = json['name'],
        phone = json['phone_number'],
        parent = json['parent_number'],
        email = json['email'],
        password = json['password'],
        active = json['active'],
        type = json['type'],
        startDate=json['start_date'],
        endDate=json['end_date'],
        grade = json['grade'],
        subjects=json['subjects']
  ;
  Map<dynamic, dynamic> toJSON() {
    return <dynamic, dynamic>{
      '_id': id ,
      'name':name,
      'phone_number': phone,
      'parent_number': parent,
      'email': email,
      'password': password,
      'active':active,
      'type':type,
      'start_date':startDate,
      'end_date':endDate,
      'grade': grade,
      'subjects':subjects
    };
  }

}