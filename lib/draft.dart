//import 'package:flutter/material.dart';
//return Stack(
//children: <Widget>[
//Container(
//decoration: new BoxDecoration(
//image: new DecorationImage(
//image: new AssetImage(
//"images/background.jpg"), fit: BoxFit.cover,),
//),
//),
//Form(
//key: _formKey,
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//TextFormField(
//validator: (value) {
//if (value.isEmpty) {
//return 'Enter some text';
//}
//return null;
//},
//),
//Padding(
//padding: const EdgeInsets.symmetric(vertical: 16.0),
//child: RaisedButton(
//onPressed: () {
//// Validate returns true if the form is valid, or false
//// otherwise.
//if (_formKey.currentState.validate()) {
//// If the form is valid, display a Snackbar.
//Scaffold.of(context)
//    .showSnackBar(SnackBar(content: Text('Processing Data')));
//}
//},
//child: Text('Submit'),
//),
//),
//],
//),
//);
//
//],
////);
//Padding(
//padding: const EdgeInsets.symmetric(vertical: 16.0),
//RaisedButton(
//onPressed: () {
//// Validate returns true if the form is valid, or false
//// otherwise.
//if (_formKey.currentState.validate()) {
//// If the form is valid, display a Snackbar.
//Scaffold.of(context).showSnackBar(
//SnackBar(content: Text('Processing Data')));
//}
//},
//child: Text('Login'),
//)
//),\
//
//RaisedButton(
//onPressed: () {
//// Validate returns true if the form is valid, or false
//// otherwise.
//if (_formKey.currentState.validate()) {
//// If the form is valid, display a Snackbar.
//Scaffold.of(context).showSnackBar(
//SnackBar(content: Text('Processing Data')));
//}
//},
//child: Text('Login'),
//),
//
//RichText(
//text: TextSpan(
//text: 'Hello ',
//style: TextStyle(
//color: Colors.black
//),
//children: <TextSpan>[
//TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
//TextSpan(text: ' world!'),
//],
//),
//)
//==============================================================================================
//DropdownButton(
//        items: categories.map((String dropDownStringItem){
//            return DropdownMenuItem<String>(
//              value: dropDownStringItem,
//              child: Text(dropDownStringItem),
//            );
//        }).toList(),
//        value: categories[2],
//        onChanged: (valueSelectedByUser){
//          debugPrint('User selected $valueSelectedByUser');
//        },
//
//      ),