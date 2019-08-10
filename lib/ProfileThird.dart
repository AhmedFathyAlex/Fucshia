import 'package:flutter/material.dart';

class ProfileThird extends StatefulWidget {
  @override
  _ProfileThirdState createState() => _ProfileThirdState();
}

class _ProfileThirdState extends State<ProfileThird> {
  @override
  Widget build(BuildContext context) {
    var ScreenHeight = MediaQuery.of(context).size.height;
    var ScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children:<Widget>[
          Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: ScreenHeight / 8),
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
            SizedBox(
              height: 20,
            ),
            Text(
              'Ahmed Fathy',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'fathi@almobarmig.com',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 15),
            Text(
              '01142388475',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 30),
//          listButton('My personal data'),
//          listButton("My previous orders"),
            card('My personal data', ScreenWidth),
             card('My previous orders', ScreenWidth),
             card('My Loved ones', ScreenWidth),

          ],
        ),
     ] ,
      ),

    );
  }

  Widget listButton(String button) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        child: Text(button),
        onPressed: () {},
      ),
    );
  }

  Widget card(String label, var width) {
    return InkWell(
      onTap: (){},
      child: Card(
        margin: EdgeInsets.all(0.4),
//        color: Colors.teal,
        child: SizedBox(
          height: 60,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.keyboard_arrow_left),
                Text(
                  label,
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
