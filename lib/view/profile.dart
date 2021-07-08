import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      elevation: 0,
        title: Text('بيانات الطالب',style: TextStyle(color:Color(0xff0369CD),fontSize: 25),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 28,top: 31),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 18),
              child: Row(
                children: [
                  Text('الاسم الثلاثي: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                  Text('احمد طاهر عبد السلام',style: TextStyle(fontSize: 18),)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 18),
              child: Row(
              children: [
                Text('رقم الهاتف: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                Text('01012030316',style: TextStyle(fontSize: 18),)
              ],
            )),
              Padding(padding: EdgeInsets.only(bottom: 18),
    child: Row(
              children: [
                Text('رقم هاتف ولي الامر: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                Text('012452326526',style: TextStyle(fontSize: 18),)
              ],
            )),
            Padding(padding: EdgeInsets.only(bottom: 18),
                child: Row(
                  children: [
                    Text('نهايه الاشتراك: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                    Text('25/6',style: TextStyle(fontSize: 18),)
                  ],
                )),
            Row(
              children: [
                Text('الصف: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                Text('الثالث الثانوي',style: TextStyle(fontSize: 18),)
              ],
            ),


          ],
        ),
      ),
    );
  }
}
