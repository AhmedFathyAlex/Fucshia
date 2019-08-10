import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CalcState();
  }
}

class _CalcState extends State<Calc> {
  var formKey = GlobalKey<FormState>();
  var _currencies = ['dolar', 'pound', 'Euero', 'Rupees'];
  final minimumPadding = 5.0;
  var Selected = 'Rupees';
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();
  var displayResult = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      ),
      debugShowCheckedModeBanner: false,
      title: "new Calculator App",
      home: Scaffold(
//        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Simple Interest App"),
        ),
        body: Form(
          key: formKey,
          child:
          Padding(
             padding:  EdgeInsets.all(minimumPadding),
//          margin: EdgeInsets.all(minimumPadding),
          child: ListView(
            children: <Widget>[
              getImage(),
              Padding(
                padding: EdgeInsets.only(top: minimumPadding,bottom: minimumPadding),
                child:TextFormField(
                  cursorColor: Colors.white,
                  validator: (String value){
                    if (value.isEmpty){
                      return "what the heck!";
                    }
                  },
                  controller: principalController,
                  style: textStyle,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'principal',
                  errorStyle: TextStyle(
                    color: Colors.white
                  ),
                  hintText: 'Enter principal',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  )
                ),
              ),
              ),
              Padding(
                padding: EdgeInsets.only(top: minimumPadding,bottom: minimumPadding),
                child:TextField(
                  controller: rateController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Rate of interest',
                      hintText: 'In percent',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                  ),
                ),
              ),
              Padding( padding: EdgeInsets.only(top: minimumPadding,
              bottom: minimumPadding),
                child:
              Row(
                children: <Widget>[
                  Expanded(child:
                  TextField(
                    controller: termController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Term',
                      hintText: 'Time in years',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                      ),
                    ),
                  ),
              ),
                  Container(width: minimumPadding*5),
                  Expanded(child:
                  DropdownButton<String>(
                    items:  _currencies.map((String dropDownStringItem){
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
                  ),
                  )
                ],
              ),
              ),
              Padding(padding: EdgeInsets.only(top: minimumPadding,bottom: minimumPadding),
                child:
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Calculate"),
                        onPressed: (){

                          setState(() {
                            if(formKey.currentState.validate()){
                              this.displayResult = calculate();
                            }

                          });
                    },
                    
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Reset"),
                      onPressed: (){
                      setState(() {
                        reset();
                      });
                      },

                    ),
                  )
                ],
              ),
              ),
              Padding(
                padding: EdgeInsets.only(top: minimumPadding,
                bottom: minimumPadding),
                child: Text("$displayResult  $Selected"),
              )
            ],
          ),
        ),
        ),
      ),
    );
  }

  Widget getImage() {
    AssetImage imageAsset = AssetImage('images/Bank.jpg');
    Image image = Image(
      image: imageAsset,
      width: 150.0,
      height: 125,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(minimumPadding*10),
    );
  }

  String calculate() {
    double principal = double.parse(principalController.text);
    double rate = double.parse(rateController.text);
    double term = double.parse(termController.text);
    double totalAmountPayable = principal + (principal*rate*term)/100;
    String result = "After $term Years you will be worth $totalAmountPayable";
    return result;


  }

  void reset() {
    principalController.text = "";
    termController.text = "";
    rateController.text = "";
    displayResult = "";

  }
}
