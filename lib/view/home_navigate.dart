import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/add_subject.dart';
import 'package:video_app/view/home_page.dart';
import 'package:video_app/view/profile.dart';
import 'package:video_app/view/subjects.dart';

class HomeNavigate extends StatefulWidget {
  @override
  _HomeNavigateState createState() => _HomeNavigateState();
}

class _HomeNavigateState extends State<HomeNavigate> {
  void dispose() {
    super.dispose();
  }
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageStudent(),
    AddSubjects(),
    Subjects(),
    Profile(),

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
                label: '',

            ),
            BottomNavigationBarItem(

                activeIcon:Icon(Icons.note_add_rounded,color: Color(0xff0369CD),),

                icon: Icon(Icons.note_add_rounded),
                label: 'اضافه مواد'
            ),
            BottomNavigationBarItem(
                activeIcon:Icon(Icons.book,color: Color(0xff0369CD),),

                icon:Icon(Icons.book),
                label: 'المواد'

            ),
            BottomNavigationBarItem(
                activeIcon:Icon(Icons.account_box,color: Color(0xff0369CD),),
                icon:Icon(Icons.account_box),
                label: 'بيانات الطالب'

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