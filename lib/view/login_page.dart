import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/view/admin_navigation.dart';
import 'package:video_app/view/registration.dart';
import 'package:video_app/view/home_navigate.dart';
import 'package:video_app/view/view_models/login_vm.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginViewModel _loginViewModel;
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  void initState() {
    _loginViewModel=getIt<LoginViewModel>();
    _loginViewModel.onLogged.stream.listen((event) {Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          Directionality(textDirection: TextDirection.rtl, child: HomeNavigate())),
    );});
    _loginViewModel.onLoggedAdmin.stream.listen((event) {Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          Directionality(textDirection: TextDirection.rtl, child: AdminNavigation())),
    );});
    _loginViewModel.onLoggedError.stream.listen((event) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('خطا في الدخول',textAlign: TextAlign.right,),
            content: const Text('لقد انتهت مده التسجيل او خطا في البريد او كلمه السر',textAlign: TextAlign.right,),
            actions: [
              TextButton(
                child: Text('حسنا'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
    // TODO: implement initState
    super.initState();
  }

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
controller: phoneController,
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
          controller: passwordController,
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

              _loginViewModel.login(phoneController.text, passwordController.text);
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
                      padding: EdgeInsets.fromLTRB(134, 100, 129, 0),
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(color: Color(0xff0369CD),fontSize: 25),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(127, 32, 126, 69),
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                          'assets/logo.png'
                  ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 12.5),
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


                  // ),

                  Padding(padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
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