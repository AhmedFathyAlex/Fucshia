import 'package:flutter/material.dart';

class ProfileSec extends StatefulWidget {
  @override
  _ProfileSecState createState() => _ProfileSecState();
}

class _ProfileSecState extends State<ProfileSec> {
  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).size.height / 5;
    return Scaffold(
//      body: ListView(
//        children: <Widget>[
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),
            clipper: getClipper(),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 5,
            left: MediaQuery.of(context).size.width / 2 - 75,
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
//                      color: Colors.red,
                  image: DecorationImage(
                    image: AssetImage('images/man.jpg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(75.0),
                  boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: topPadding + 150),
            child: Center(
//            width: 350,
//            top: MediaQuery.of(context).size.height / 5,
//            left: MediaQuery.of(context).size.width / 5.6,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: topPadding,
                    ),
                    Text(
                      'My Cool User',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('7-8-1997'),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('0111001110101'),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('user@almobarmig.com'),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Male'),
                    SizedBox(height: 20),
                    Container(
                      height: 2.0,
                      width: 200.0,
                      color: Colors.black,
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    ),
                    SizedBox(height: 20),

                    Text(
                      'اخر المشتريات السابقة',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20),
                        Text('product'),
                        SizedBox(
                          width: 200,
                        ),
                        Text('1-1-2019')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20),
                        Text('product'),
                        SizedBox(
                          width: 200,
                        ),
                        Text('1-1-2019')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20),
                        Text('product'),
                        SizedBox(
                          width: 200,
                        ),
                        Text('1-1-2019')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
//        ],
//      ),
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
