import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/view_models/adding_video_vm.dart';

class AddingVideo extends StatefulWidget {
  const AddingVideo({Key? key}) : super(key: key);

  @override
  _AddingVideoState createState() => _AddingVideoState();
}

class _AddingVideoState extends State<AddingVideo> {
  late AddVideoViewModel _addVideoViewModel;
@override
  void initState() {
  _addVideoViewModel=getIt<AddVideoViewModel>();
  _addVideoViewModel.onAdded.stream.listen((event) {

    Navigator.of(context).pop();
  });
    // TODO: implement initState
    super.initState();
  }
  int _value=1;
  int _sub=1;
  TextEditingController subjectNameController=TextEditingController();
  TextEditingController unitController=TextEditingController();
  TextEditingController lessonController=TextEditingController();
  TextEditingController linkController=TextEditingController();
  @override
  Widget build(BuildContext context) {


    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);


    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('الفيديوهات',style: TextStyle(fontSize: 25,color: Color(0xff0369CD)),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: DropdownButton(

                   value: _sub,
                   items: [
                     DropdownMenuItem(
                       child: Text("جبر"),
                       value: 1,
                     ),
                     DropdownMenuItem(
                       child: Text("استاتيكا"),
                       value: 2,
                     ),
                     DropdownMenuItem(
                       child: Text("ديناميكا"),
                       value: 3,
                     ),
                     DropdownMenuItem(
                       child: Text("هندسة فراغية"),
                       value: 4,
                     ),

                   ],

                   onChanged: (x) {
                     setState(() {
                       _sub = x as int ;
                     });
                   },
                 ),
               ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller:unitController ,

                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: true,
                      //suffixIcon: Icon(Icons.email ,color: cBlue),
                      suffixIcon: Icon(Icons.assignment_rounded,color: Colors.blue),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                      hintText: "اسم الوحده",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller:lessonController ,

                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: true,
                      //suffixIcon: Icon(Icons.email ,color: cBlue),
                      suffixIcon: Icon(Icons.assignment_rounded,color: Colors.blue),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                      hintText: "اسم الدرس",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  controller:linkController ,

                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: true,
                      //suffixIcon: Icon(Icons.email ,color: cBlue),
                      suffixIcon: Icon(Icons.assignment_rounded,color: Colors.blue),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

                      hintText: "الفيديو",
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)
                  ),
                ),
              ),
        Padding(padding: EdgeInsets.only(top: 10),
        child: DropdownButton(

          value: _value,
          items: [
            DropdownMenuItem(
              child: Text("الصف الثالث الثانوي"),
              value: 1,
            )
          ],

          onChanged: (x) {
            setState(() {
              _value = x as int ;
            });
          },
        ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
              width: 330,
              height: 52,
              child:Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  onPressed: () {
                    _addVideoViewModel.addNew(_sub==1?'جبر':_sub==2?"استاتيكا":
                        _sub==3?"ديناميكا":"هندسة فراغية"
                        , unitController.text, lessonController.text,
                        linkController.text,_value);
                  },
                  child: Text("اضافه فيديو",
                      textAlign: TextAlign.center,

                      style: style.copyWith(
                          fontSize: 20,
                          color: Colors.white, fontWeight: FontWeight.normal)),
                ),
              )
          ),
        )




        ],
          ),
        ),
      ),
    );
  }
}
