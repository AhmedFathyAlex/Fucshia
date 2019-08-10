import 'dart:async';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Database_Helper.dart';
import 'package:fuchsia_app/Profile.dart';
import 'package:fuchsia_app/User.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseHelper helper = DatabaseHelper();
  User myUser;

  @override
  Future initState() {
    // TODO: implement initState
    super.initState();
    print('init first');
    checkUser();
    print(myUser);
    if (myUser == null) {
      notLoggedIn();
    }
    else {
      isLoggedIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('build first');

    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Colors.deepPurple, Colors.blueAccent])),
    );
  }

  checkUser() async {
    List list = await helper.getUserList();
    if (list.length != 0) {
      myUser = list[0];
    }
  }

  isLoggedIn() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Profile(myUser);
      }));
    });
  }

  notLoggedIn() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MyCustomForm();
      }));
    });
  }
}
