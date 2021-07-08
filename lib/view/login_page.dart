import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
            suffixIcon: Icon(Icons.email,color: cBlue),
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
          suffixIcon: Icon(Icons.lock,color: cBlue),
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
        onPressed: () {},
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

            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 300.0),
                    Container(
                      child:emailField ,
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              //spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 4)

                          )]
                      ),
                    )
                    ,
                    SizedBox(height: 25.0),
                    Container(

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
                    SizedBox(height: 0),
                    Row(


                      children: [


                        Container(
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
                            )),

                        Container(
                            alignment: Alignment.centerRight,
                            child:Text("حفظ تسجيل الدخول")

                        ),
                        SizedBox(width: 80),


                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              splashFactory: NoSplash.splashFactory,

                              textStyle: const TextStyle(fontSize: 14),
                            ),

                            onPressed: () {},
                            child: const Text('هل نسيت كلمة السر؟'),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(

                      child: loginButton,
                    ),
                    SizedBox(height: 30),
                    TextButton(
                      style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,

                        textStyle: const TextStyle(fontSize: 14),
                      ),

                      onPressed: () {},
                      child: const Text('إنشاء حساب جديد'),
                    ),

                  ]
              ),
            ),

          )

      ),

    );
  }
}