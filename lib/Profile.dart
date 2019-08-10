import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:fuchsia_app/User.dart';

class Profile extends StatelessWidget {
  User person;
  //constructor takes the profile url photo
  Profile(this.person);
  @override
  Widget build(BuildContext context) {
    print('!!!!!!!!!!!!!!!!!!!!!*************************************!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print('${person.imageUrl}');
    return new MaterialApp(
      title: 'Profile Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(
          title: 'Profile',
     userName: person.userName,
          userEmail: person.email,
          Url: person.imageUrl),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
 final String userName;
  final String userEmail;
  final String Url;

  MyHomePage({Key key, this.title, this.userName,this.userEmail, this.Url});


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String userName;
  final String userEmail;
  final String url='';
//  _MyHomePageState({this.userName, this.userEmail, this.url});
  _MyHomePageState({this.userName, this.userEmail});

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.blue,
        ),
        new Image.network(url, fit: BoxFit.fill),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
        ),
        new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            drawer: new Drawer(
              child: new Container(),
            ),
            backgroundColor: Colors.transparent,
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: _height / 12,
                  ),
//                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: NetworkImage(imgUrl),),
                  new SizedBox(
                    height: _height / 25.0,
                  ),
                  new Text(
                    widget.userName??'nulll',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  ),
                  Container(
                    child: Image.network(
                        widget.Url ??
                            "https://fuchsia4u.s3-us-west-1.amazonaws.com/media/man.png",
                        fit: BoxFit.fill),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 30, left: _width / 8, right: _width / 8),
                    child: new Text(
                      '${widget.userEmail}\nSometime I work at google as Executive Chairman ',
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: _width / 25,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.white),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ));
}
