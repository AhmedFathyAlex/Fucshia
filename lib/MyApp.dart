import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        alignment: Alignment.center,
        color: Colors.deepPurple,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'spice Jet',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'From alexandria to cairo',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Direct Train',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'From Tanta  to berket el sab3',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        fontSize: 20.0,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
            FlightImageAsset(),
            FlightBookButton(),
          ],
        ),
      ),
    );
  }
}

class FlightImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    AssetImage assetImage = AssetImage('images/download.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return image;
  }
}
class FlightBookButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 50,
      margin: EdgeInsets.only(top:30),
      child: RaisedButton(
      child: Text("Book your flight",
        style: TextStyle(
        fontSize: 20,
          color: Colors.white
      ),),
      elevation: 6.0,
      color: Colors.orange,
          onPressed:() => bookFlight(context)

      ),
    );
  }
  void bookFlight(BuildContext context){
    var alertDialog = AlertDialog(
      title: Text("Flight Booked Successfully"),
      content: Text("Have a pleasuent flight"),
    );
    showDialog(context: context,
      builder: (BuildContext context) => alertDialog

    );

  }

}
