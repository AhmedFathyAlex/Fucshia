import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fuchsia_app/RelatedPepole.dart';

class Draft extends StatelessWidget {
  List<RelatedPepole> list = List();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () async {
          list = await  getMyData();
          print('----------printing from on pressed----------');
          print(list[0].cUSName);
          print(list.length);
          },
          child: Text(
            'Press Here',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

Future<List<RelatedPepole>> getMyData() async {
  List<RelatedPepole> listMethod = List();
  print('zzzzzzzzzzzzzzzzzzzzzzzzz');

  final String urlFstPart = 'http://fuchsia4u.herokuapp.com';
  final String urlMainCat =
      '/api/v1/sell/customer/customerPerSpec/?M=1&customer=3';
  String url = urlFstPart + urlMainCat;
  String token = '6e5c5ec6aeeb19cbc7d9f3971458752c4c9771b1';
  final response = await http.get(url, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Token $token', // Opend to all Users
  });
  if (response.statusCode == 200) {
    print('Status code = 20000000000000000000');
//    String bodyutf8 = utf8.decode(response.bodyBytes);
//   listMethod  = (json.decode(bodyutf8) as List)
//    // list = (json.decode(response.body) as List)
//        .map((data) => new RelatedPepole.fromJson(data))
//        .toList();

    final String responseBody = await utf8.decode(response.bodyBytes);
//    print('-------------------First body------------');
//    print(responseBody);
    List myList = (json.decode(responseBody) as List);
//    print('--------------------my list [0] ----------------');
//    print(myList[0]);
//    print('--------------------my list [1]  ----------------');
//    print(myList[1]);

    for (int i = 0; i < myList.length; i++) {
      listMethod.add(RelatedPepole.fromJson(myList[i]));
    }
    print('----------------test-------------');
    print(listMethod[0].id);
    print(listMethod[0].cUSName);


    return listMethod;
  } else {
    print('Not 200');
  }
}
