import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/view/registration.dart';
import 'package:video_app/view/home_navigate.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  int _count = 0;
  bool isChecked = false;
  final cGray = const Color(0xFFC4C4C4);
  final cBlue = const Color(0xFF0369CD);


  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return cGray;
      }
      return cBlue;
    };
    final emailField =Container(
      width: 330,
      height: 52,
      child: TextField(

        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            fillColor: cGray,
            filled: true,
            prefixIcon: Icon(Icons.email,color: cBlue),
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

            hintText: "البريد الإلكتروني",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)
        ),
      ),
    );

    final passwordField = Container(
        width: 330,
        height: 52,
        child: TextField(
          textAlign: TextAlign.right,
          obscureText: true,

          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(

              fillColor: cGray,
              filled: true,
              //icon: new Icon(Icons.lock, color: Color(0xff224597)),
              prefixIcon: Icon(Icons.lock,color: cBlue),

              contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              hintText: "كلمة السر",

              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)


          ),
        )
    );

    final loginButton = Container(
        width: 330,
        height: 52,
        child:Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10.0),
          color: cBlue,
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    Directionality(textDirection: TextDirection.rtl, child: HomeNavigate())),
              );
            },
            child: Text("تسجيل الدخول",
                textAlign: TextAlign.center,

                style: style.copyWith(
                    fontSize: 20,
                    color: Colors.white, fontWeight: FontWeight.normal)),
          ),
        )
    );
    return Scaffold(

      body: Center(
          child : SingleChildScrollView(



            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 300, 10, 12.5),
                    child: Container(
                      child:emailField ,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              //spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 4)

                          )]
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 12.5, 10, 0),
                    child:  Container(

                      child:passwordField ,
                      decoration: BoxDecoration(

                          boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              //spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 4)

                          )]
                      ),
                    ),
                  )  ,
                  // Padding(
                  // padding: EdgeInsets.fromLTRB(10, 0, 10, 15),
                  // child:
            Row(


                    children: [

                      Padding(padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Container(
                            width: 36,
                            child: Checkbox(

                              shape: CircleBorder(),
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            )
                        ),
                      ),


                      Container(
                          alignment: Alignment.centerRight,
                          child:Text("حفظ تسجيل الدخول")

                      ),
                      Padding(padding: EdgeInsets.fromLTRB(80, 0, 25, 0),
                        child:  Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,

                              textStyle: const TextStyle(fontSize: 14),
                            ),

                            onPressed: () {},
                            child: const Text('هل نسيت كلمة السر؟'),
                          ),
                        ),
                      )



                    ],
                  ),


                  // ),

                  Padding(padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                    child: Container(

                      child: loginButton,
                    ),),

                  Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child:  TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,

                        textStyle: const TextStyle(fontSize: 14),
                      ),

                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Registration()),
                        );

                      },
                      child: const Text('إنشاء حساب جديد'),
                    ),
                  )


                ]
            ),


          )

      ),

    );
  }
}