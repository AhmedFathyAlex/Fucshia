import 'package:flutter/material.dart';
import 'Login.dart';
import 'dart:ui' as ui;
import 'package:fuchsia_app/SplashScreen.dart';
import 'Search.dart';
import 'CustomSearch.dart';
import 'ProfileSec.dart';
import 'package:fuchsia_app/ProfileThird.dart';
import 'package:fuchsia_app/Payment_method_Choosing.dart';

void main() {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:PaymentMethodChoosing(),
    ));
}

//
//Widget getListView() {
//  var listView = ListView(
//    children: <Widget>[
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      ),
//      ListTile(
//        leading: Icon(Icons.landscape),
//        title: Text("Landscape"),
//        subtitle: Text("Beautiful View"),
//        trailing: Icon(Icons.wb_sunny),
//      )
//    ],
//  );
//  return listView;
//}
