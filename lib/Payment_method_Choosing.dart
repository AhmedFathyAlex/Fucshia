import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuchsia_app/User.dart';
class PaymentMethodChoosing extends StatefulWidget{
  @override
  PaymentMethodChoosingState createState() {
    // TODO: implement createState
    return PaymentMethodChoosingState();
  }

}
class PaymentMethodChoosingState extends State<PaymentMethodChoosing> {
  List<User> myUsers = [
    User(userName: 'AhmedFathy',email: "Alexandria,Egypt"),
    User(userName: 'Osama maany',email: "Aga,Almansoura")
  ];

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
                showDialog(context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('${myUsers[_selectedIndex].userName} \n $paymentMethod'),
                  );
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
                          Image(image: AssetImage('images/arrived.jpg'),
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
                         Image(image: AssetImage('images/mada.png'),
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
                            image: AssetImage('images/visaMaster.jpg'),
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
                            image: AssetImage('images/sdad.jpg'),
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
            itemCount: myUsers.length,
              itemBuilder:(context,index){
                return Card(
                  color: _selectedIndex != null && _selectedIndex == index
                      ? Colors.deepPurple
                      : Colors.white,
                  child: ListTile(
                    onTap:  () => _onSelected(index),
                    leading:Icon(Icons.person) ,
                    title: Text(myUsers[index].userName),
                    subtitle: Text(myUsers[index].email),
                  ),
                );
              },
          ),
          )
        ],
      ),
    );
  }
}
