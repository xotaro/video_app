import 'package:flutter/material.dart';



class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  int _count = 0;
  bool isChecked = false;
  final cGray = const Color(0xFFC4C4C4);
  final cBlue = const Color(0xFF0369CD);
  final String Pen = 'assets/Edit.svg';

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
    final fullName =Container(
      width: 330,
      height: 52,
      child: TextField(

        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            fillColor: cGray,
            filled: true,
            //suffixIcon: Icon(Icons.email ,color: cBlue),
            suffixIcon: Icon(Icons.assignment_rounded,color: cBlue),
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

            hintText: "الاسم الثلاثي",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)
        ),
      ),
    );
    final phoneNumber =Container(
      width: 330,
      height: 52,
      child: TextField(

        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            fillColor: cGray,
            filled: true,
            //suffixIcon: Icon(Icons.email ,color: cBlue),
            suffixIcon: Icon(Icons.phone_android,color: cBlue),
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

            hintText: "رقم الهاتف",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)
        ),
      ),
    );
    final phoneNumber2 =Container(
      width: 330,
      height: 52,
      child: TextField(

        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            fillColor: cGray,
            filled: true,

            suffixIcon: Icon(Icons.phone_android,color: cBlue),
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),

            hintText: "رقم هاتف الاب",
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)
        ),
      ),
    );
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
    final passwordField2 = Container(
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
              hintText: "تأكيد كلمة السر",

              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0) , borderSide: BorderSide.none)


          ),
        )
    );

    final registrationButton = Container(
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
            child: Text("إنشاء حساب",
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
              padding: const EdgeInsets.fromLTRB(5,150,5,5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10),
                        child:  Container(
                          child:fullName ,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  //spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4)

                              )]
                          ),
                        ))

                    , Padding(padding: EdgeInsets.all(5),

                        child : Container(
                          child:phoneNumber ,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  //spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4)

                              )]
                          ),
                        ))
                    ,Padding(padding: EdgeInsets.all(5),

                        child : Container(
                          child:phoneNumber2 ,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  //spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4)

                              )]
                          ),
                        ))
                    ,Padding(padding: EdgeInsets.all(5),

                        child : Container(
                          child:emailField ,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  //spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4)

                              )]
                          ),
                        ))
                    ,Padding(padding: EdgeInsets.all(5),

                        child : Container(
                          child:passwordField ,
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  //spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4)

                              )]
                          ),
                        ))
                    ,Padding(padding: EdgeInsets.all(5),

                        child : Container(

                          child:passwordField2 ,
                          decoration: BoxDecoration(

                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  //spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4)

                              )]
                          ),
                        )),
                    Padding(padding: EdgeInsets.fromLTRB(5,50,5,10),

                      child :



                      Container(

                        child: registrationButton,
                      ),)


                  ]
              ),
            ),

          )

      ),

    );
  }
}
