import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/models/student.dart';
import 'package:video_app/view/view_models/profile_vm.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ProfileViewModel _profileViewModel;
  @override
  void initState() {
    // TODO: implement initState
    _profileViewModel=getIt<ProfileViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      elevation: 0,
        title: Text('بيانات الطالب',style: TextStyle(color:Color(0xff0369CD),fontSize: 25),),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider.value(
        value: _profileViewModel,
        child: Consumer<ProfileViewModel>(
          builder: (context, value, child){

            if(_profileViewModel.show==true){
              Student student=_profileViewModel.student;
             return Padding(
                padding: EdgeInsets.only(right: 28,top: 31),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(bottom: 18),
                      child: Row(
                        children: [
                          Text('الاسم الثلاثي: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                          Text(student.name,style: TextStyle(fontSize: 18),)
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Text('رقم الهاتف: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                            Text(student.phone,style: TextStyle(fontSize: 18),)
                          ],
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Text('رقم هاتف ولي الامر: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                            Text(student.parent,style: TextStyle(fontSize: 18),)
                          ],
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 18),
                        child: Row(
                          children: [
                            Text('نهايه الاشتراك: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                            Text(student.endDate,style: TextStyle(fontSize: 18),overflow: TextOverflow.ellipsis,)
                          ],
                        )),
                    Row(
                      children: [
                        Text('الصف: ',style: TextStyle(color: Color(0xff0369CD),fontSize: 18),),
                        Text(student.grade==1?'الصف الثاني الثانوي':'الصف الثالث الثانوي',style: TextStyle(fontSize: 18),)
                      ],
                    ),


                  ],
                ),
              );
            }else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 15,
                    ),
                    LinearProgressIndicator(),
                  ],
                ),
              );

            }

          }
        ),
      ),
    );
  }
}
