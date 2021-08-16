import 'package:flutter/material.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/view_models/register_vm.dart';



class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late RegisterViewModel _registerViewModel;
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController parentController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPassController=TextEditingController();
  @override
  void initState() {
    _registerViewModel=getIt<RegisterViewModel>();
    _registerViewModel.onRegistered.stream.listen((event) {Navigator.of(context).pop();});
    // TODO: implement initState
    super.initState();
  }
  @override
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  int _count = 0;
  bool isChecked = false;
  final cGray = const Color(0xFFC4C4C4);
  final cBlue = const Color(0xFF0369CD);
  final String Pen = 'assets/Edit.svg';
  bool appear=false;
  bool appear2=false;
  bool isValidEmail(String s) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(s);
  }
  bool validMail=true;
  int _value=1;
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
        keyboardType: TextInputType.name,
        controller:nameController ,
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
        keyboardType: TextInputType.phone,
        controller: phoneController,
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
        keyboardType: TextInputType.phone,
        controller: parentController,
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
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: emailController,
        onChanged: (s) {
          if(s.isEmpty){
            validMail=true;
          }else{
            validMail=isValidEmail(s);
          }
        },
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          errorText: validMail?null:'يرجى التاكد من البريد الإلكتروني' ,
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
          controller: passwordController,
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
          controller: confirmPassController,
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

    final registrationButton =
    Container(
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

              if (nameController.text.isEmpty || phoneController.text.isEmpty || parentController.text.isEmpty||
              emailController.text.isEmpty || passwordController.text.isEmpty ||confirmPassController.text.isEmpty||validMail==false){
                setState(() {
                  appear =true;

                });
              }else if(passwordController.text!=confirmPassController.text){
                setState(() {
                  appear2=true;

                });
              }else{
                setState(() {
                  appear=false;
                  appear2=false;
                });

                _registerViewModel.registerNew(nameController.text, phoneController.text, parentController.text,
                    emailController.text, passwordController.text,2,context);
              }

            },
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
                        )
                    )

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

                    Padding(padding: EdgeInsets.fromLTRB(5, 0, 30, 5),
                      child: Align(
                        alignment: Alignment.centerRight,
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
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(5,40,5,10),

                      child :



                      Container(

                        child: registrationButton,
                      ),
                    ),
                    appear?Text('يرجى ملئ جميع البيانات',style: TextStyle(color: Colors.red,fontSize: 15),):Text(''),
                    appear2?Text('الرقم السري غير مطابق',style: TextStyle(color: Colors.red,fontSize: 15),):Text(''),



                  ]
              ),
            ),

          )

      ),

    );
  }
}
