import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/admin_requests.dart';
import 'package:video_app/view/admin_home.dart';
import 'package:video_app/view/admin_students_list.dart';
import 'package:video_app/view/admin_add_video.dart';

class AdminNavigation extends StatefulWidget {
  @override
  _AdminNavigationState createState() => _AdminNavigationState();
}

class _AdminNavigationState extends State<AdminNavigation> {
  void dispose() {
    super.dispose();
  }
  int _currentIndex = 0;
  final List<Widget> _children = [
    AdminHome(),
    StudentsList(),
    AdminAddCourse(),
    Requests(),


  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override

  Widget build(BuildContext context) {


    return Scaffold(
      body: _children[_currentIndex],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(
                color: Color(0xffC4C4C4),
                style: BorderStyle.solid
            )
            )
        ),
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(fontSize: 12,color:Color(0xff0369CD), ),
          unselectedFontSize: 12,
          iconSize: 50,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          backgroundColor: Colors.white,
          items: [
            //Todo add spearators
            BottomNavigationBarItem(

              activeIcon: Icon(Icons.home,color:Color(0xff0369CD)),
              icon: Icon(Icons.home),
              label: 'الرئيسيه',

            ),
            BottomNavigationBarItem(

                activeIcon:Icon(Icons.article,color: Color(0xff0369CD),),

                icon: Icon(Icons.article),
                label: 'قائمة الطلاب'
            ),
            BottomNavigationBarItem(
                activeIcon:Icon(Icons.add_to_queue_outlined,color: Color(0xff0369CD),),

                icon:Icon(Icons.add_to_queue_outlined),
                label: 'المقاطع'

            ),
            BottomNavigationBarItem(
                activeIcon:Icon(Icons.note_add_rounded,color: Color(0xff0369CD),),
                icon:Icon(Icons.note_add_rounded),
                label: 'طلبات التسجيل'

            )
          ],
        ),
      ),
    );
  }
}
Widget ActiveIconCustom(String iconName,TextStyle textStyle){
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(iconName,style: textStyle),
      SizedBox(height: 5,),
      Icon(Icons.circle,color: Colors.black, size:4,)
    ],
  );
}
