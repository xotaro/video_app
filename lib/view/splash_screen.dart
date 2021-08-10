import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_app/di/di_config.dart';
import 'package:video_app/di/mongo.dart';
import 'package:video_app/view/home_navigate.dart';
import 'package:video_app/view/login_page.dart';
import 'package:video_app/view/view_models/profile_vm.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Database _database;
  @override
  void initState() {
    _database=getIt<Database>();
    _database.dbReady.stream.listen((event) {
      Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
          builder: (context) => LoginPage()
      ));


    });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff0369CD),
      child: Padding(
        padding: EdgeInsets.only(left: 85,right: 85),
        child: Center(
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                  'assets/logo.png'
              ),
            )
        ),
      ),
    );  }
}
