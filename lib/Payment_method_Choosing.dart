import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuchsia_app/User.dart';
import 'package:fuchsia_app/RelatedPepole.dart';
class PaymentMethodChoosing extends StatefulWidget{
  @override
  PaymentMethodChoosingState createState() {
    // TODO: implement createState
    return PaymentMethodChoosingState();
  }

}
class PaymentMethodChoosingState extends State<PaymentMethodChoosing> {
  List<RelatedPepole> myUsers;
  int _selectedIndex = 0;
//  bool visa = false;
//  bool mada = false;
//  bool cash = false;
//  bool sdad = false;
  String paymentMethod = '';


  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }
  @override
  Widget build(BuildContext context) {
    prepareMyList();
    return Scaffold(
      appBar: AppBar(
        title: Text('ادفع الان'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 6,),
          Center(child:
          ButtonTheme(
            minWidth: 200.0,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
//                showDialog(context: context,
//                builder: (BuildContext context){
//                  return AlertDialog(
//                    title: Text('${myUsers[_selectedIndex].userName} \n $paymentMethod'),
//                  );
//                });
              setState(() {
                print('--------------prepare My list------------');
                prepareMyList();
              });
              },
              child: Text("دفع  ",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white
              ),),
            ),
          ),
          ),
          SizedBox(height: 6),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    setState(() {
                      paymentMethod='Cash';
                    });
                  },
                  child: Container(

                    color: paymentMethod=='Cash'?Colors.deepPurple:Colors.white,
                    child: GestureDetector(

//                      onTap: (){
//                        setState(() {
//                          sdad=false;
//                          mada = false;
//                          visa = false;
//                          cash = true;
//                        });
//                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(image: NetworkImage('https://fuchsia4u.s3-us-west-1.amazonaws.com/media/payWhenRecieved.jpg'),
                            height: 50,
                            width: 150,),
                          Text('الدفع عند الاستلام')
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                InkWell(
                    onTap: (){
                      setState(() {
                        paymentMethod='Mada';
                      });
                    },
                  child: Container(
                    color: paymentMethod =='Mada'?Colors.deepPurple:Colors.white,
                    child: GestureDetector(
//                     onTap: (){
//                       setState(() {
//                         paymentMethod='Mada';
//                       });
//                     },
                     child:Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Image(image: NetworkImage('https://fuchsia4u.s3-us-west-1.amazonaws.com/media/Mada.jpg'),
                         height: 50,
                         width: 150,),
                         Text('مدي')
                       ],
                     ),
               ),
                  ),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: (){
                    setState(() {
                      paymentMethod='Visa-Master';
                    });
                  },
                  child: Container(
                    color:  paymentMethod=='Visa-Master'?Colors.deepPurple:Colors.white,

                    child: GestureDetector(
//                      onTap: (){
//                        setState(() {
//                          paymentMethod='Visa-Master';
//                        });
//                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            image: NetworkImage('https://fuchsia4u.s3-us-west-1.amazonaws.com/media/visa.jpg'),
                            height: 50,
                            width: 150,),
                          Text('Visa / Master Card ')
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                InkWell(
                  onTap: (){
                    setState(() {
                      paymentMethod='Sdad';
                    });
                  },
                  child: Container(
                    color:  paymentMethod=='Sdad'?Colors.deepPurple:Colors.white,
                    child: GestureDetector(
//                      onTap: (){
//                        setState(() {
//                          paymentMethod='Sdad';
//                        });
//                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            image: NetworkImage('https://fuchsia4u.s3-us-west-1.amazonaws.com/media/Sdad.jpg'),
                            height: 50,
                            width: 150,),
                          Text('سداد')
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),


          Row(children: <Widget>[
            Expanded(child: Divider()),
            Text("المرسل اليه ",style: TextStyle(fontSize: 30),),
            Expanded(child: Divider()),
          ]),
          Padding(
            padding: const EdgeInsets.only( left:16.0,right: 16.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.group_add),
                  Text('قائمة الاصدقاء')
                ],
            ),
          ),
          Expanded(
//            child: Center(
//              child: ListView(
//                children: <Widget>[
//                  Card(
//                    child: ListTile(
//                      leading: Icon(Icons.person),
//                      title: Text('Ahmed Fathy'),
//                      subtitle: Text('Alexandria,Egypt'),
//                    ),
//                  ),
//                  Card(
//                    child: ListTile(
//                      leading: Icon(Icons.person),
//                      title: Text('Osama maani'),
//                      subtitle: Text('Aga,Almansoura,Egypt'),
//                    ),
//                  ),
//                ],
//              ),
//            ),
          child: ListView.builder(
            itemCount: myUsers?.length ?? 0,
//          itemCount: myUsers.length,   causing eroor
             itemBuilder:(context,index){
                return Card(
                  color: _selectedIndex != null && _selectedIndex == index
                      ? Colors.deepPurple
                      : Colors.white,
                  child: ListTile(
                    onTap:  () => _onSelected(index),
                    leading:CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(myUsers[index].cUSPic),
                      // child: Image.network(globals.manImagePath),
                    ),
                    title: Text(myUsers[index].cUSName??"Name"),
                    subtitle: Text(myUsers[index].cUSAddress??"Address" ),
                  ),
                );
              },
          ),
          )
        ],
      ),
    );
  }

  prepareMyList()async{
    myUsers = await getMyData();
  }

  Future<List<RelatedPepole>> getMyData() async {
    List<RelatedPepole> listMethod = List();
    print('zzzzzzzzzzzzzzzzzzzzzzzzz');

    final String urlFstPart = 'http://fuchsia4u.herokuapp.com';
    final String urlMainCat =
        '/api/v1/sell/customer/customerPerSpec/?M=1&customer=1';
    String url = urlFstPart + urlMainCat;
    String token = '6e5c5ec6aeeb19cbc7d9f3971458752c4c9771b1';
    print('%%%%%%%%%%%%%%%%%%%----------------%%%%%%%%%%%%%%%%%%%%');
    print('URL:: $url');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token', // Opend to all Users
    });
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    print('URL:: $url');

    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
    print('===========${response.body}');
    print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
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
      print(listMethod[0].cUSAddress);


      return listMethod;
    } else {
      print('Not 200');
    }
  }
}
