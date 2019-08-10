import 'package:flutter/material.dart';
import 'dart:convert'; //it allows us to convert our json to a list
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fuchsia_app/Profile.dart';
import 'dart:ui' as ui;
import 'package:fuchsia_app/User.dart';
import 'package:fuchsia_app/Database_Helper.dart';
class MyCustomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomFormState();
  }
}

class _CustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  DatabaseHelper helper = DatabaseHelper();

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var userName = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
//    var screenSize = MediaQuery.of(context).size;
//    double screenWidth = screenSize.width;
    final appTitle = 'Form Validation Demo';

    // TODO: implement build
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("images/white.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(17.0),
                          child: TextFormField(
                              style: TextStyle(
                                color: Colors.red,
                              ),
                              decoration: InputDecoration(
  //                          border: OutlineInputBorder(
  //                            borderRadius: BorderRadius.circular(5.0),
  //                          ),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: "username@example.com",
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter some text';
                              }
                              return null;
                            },
                            controller: emailController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(17.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              hintText: "Enter your password",
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter password';
                              }
                              if (value.length < 6) {
                                return "Password not strong enough";
                              }
                              return null;
                            },
                            controller: passController,
                            style: textStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 20),
                          child: Row(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () async {
                                  // Validate returns true if the form is valid, or false
                                  // otherwise.
                                  if (_formKey.currentState.validate()) {
                                    // If the form is valid, display a Snackbar.
                                    userName = emailController.text.trim();
                                    password = passController.text.trim();
                                    var response = await requestMethod();
                                    User person =
                                    await User.fromJson(response);
                                    print('!!!!!!!!!!!!!!!!!!!!!*************************************!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                                    print('person data\n token: ${person.token}  name: ${person.userName}  image: ${person.imageUrl}');
                                    helper.insertUser(person);
                                    moveToProfile(context, person);
                                  }
                                },
                                child: Text('Login'),
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                // forget password operation
                              },
                              child: Text(
                                "Forget password ?",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              onTap: () {
                                // forget password operation
                              },
                              child: Text(
                                "Create new account",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ], //end of list View
            ),
          ],
        ),
      ),
    );
  }

  // ======================================
  //
  //=====
  Future<Map<String, dynamic>> requestMethod() async {
    print("(((((((((((((((((((11111111))))))))))))))))))))))");
    var url = "http://fuchsia4u.herokuapp.com/users/authenticate/";
   var body = jsonEncode({"username": "$userName", "password": "$password"});

    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
    };
    print("(((((((((((((((((((22222222))))))))))))))))))))))");
    final response = await http.post(url, body: body, headers: headers);
    print("(((((((((((((((((((33333333))))))))))))))))))))))");
    print(response.statusCode);
    final responseJson = await json.decode(response.body);
    print(responseJson);
    print("(((((((((((((((((((444444444))))))))))))))))))))))");
    return responseJson;
  }
// ==========================================

  add_New_Token(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  moveToProfile(BuildContext context, User user) async {
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Profile(user);
    }));
  }
}
