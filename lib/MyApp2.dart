import 'package:flutter/material.dart';

class FavoriteCity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoritCityState();
  }
}

class _FavoritCityState extends State<FavoriteCity> {
  String name = "";
  int counter = 0 ;
 var _cuurencies = ['Rupees','Dollar','pounds'];
 var Selected = 'Rupees';

  @override
  Widget build(BuildContext context) {
    debugPrint("Favourit city widget is created");
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello city"),
      ),
      body: (
      Container(
        margin: EdgeInsets.all(20.0),
      child:Column(
            children: <Widget>[
              Padding(padding:
                  EdgeInsets.all(20.0),
                  // textFiled on submitted property takes method have one parameter
                  // this parameter is the string written in the method after clicking enter
                  // we can use onChange to make changes step by step
                  child: TextField(onChanged: (String string) {
                    setState(() {
                      counter++;
                      name = string;
                      debugPrint("Favourit city widget is Updated $counter");
                    });
                  }),
              ),
              SizedBox(height: 15.0,),
              Text("The name is $name"
              ),
              DropdownButton<String>(
                items:  _cuurencies.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                  value : dropDownStringItem,
                  child: Text(dropDownStringItem));
                }).toList(),
                onChanged: (String newValueSelected){
                  setState(() {
                    this.Selected = newValueSelected;
                  });
                },
                value: Selected,
              )
            ],
          ),
      )
    ),
    );
  }
}
