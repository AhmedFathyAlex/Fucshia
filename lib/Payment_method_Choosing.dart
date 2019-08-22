import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethodChoosing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ادفع الان'),
      ),
      body: Column(
        children: <Widget>[
          Center(child:
          Text("اختر طريقة الدفع ",
            style: TextStyle(
              fontSize: 40,

            ),
          ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: (){},
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
                SizedBox(height: 20),

                GestureDetector(
                 onTap: (){},
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
                SizedBox(height: 20),


                GestureDetector(
                  onTap: (){},
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(image: AssetImage('images/visaMaster.jpg'),
                        height: 50,
                        width: 150,),
                      Text('Visa / Master Card ')
                    ],
                  ),
                ),
                SizedBox(height: 20),

                GestureDetector(
                  onTap: (){},
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(image: AssetImage('images/sdad.jpg'),
                        height: 50,
                        width: 150,),
                      Text('سداد')
                    ],
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
            child: Center(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Ahmed Fathy'),
                      subtitle: Text('Alexandria,Egypt'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Osama maani'),
                      subtitle: Text('Aga,Almansoura,Egypt'),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
