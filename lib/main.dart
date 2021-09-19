
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:video_app/view/splash_screen.dart';
import 'di/di_config.dart';
import 'package:connectivity/connectivity.dart';


void main() async {
  configureDependencies();
    WidgetsFlutterBinding.ensureInitialized();
  // runZonedGuarded(() {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   FlutterError.onError = (FlutterErrorDetails errorDetails) {
  //     print("Will log here ${errorDetails.exception.toString()}");
  //   };
  //
  // }, (error, stackTrace) {
  //   print("For other catch ${error.toString()}");
  // });
  runApp(MyApp());

}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home:  AppHome());

  }
}


class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  void initState() {
    // TODO: implement initState
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result==ConnectivityResult.none){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              Scaffold(
                body: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('خطأ في الاتصال'),
                  ),
                ),
              )
          ),
        );
        Timer(Duration(seconds: 3), () {
          SystemNavigator.pop();
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),

        home:Directionality(textDirection: TextDirection.rtl,child:SplashScreen() )

      /* ( // add this
        textDirection: TextDirection.rtl, // set this property
       // child: LoginPage(),
        child: HomeNavigate(),
      ),*/
    );
  }
}
