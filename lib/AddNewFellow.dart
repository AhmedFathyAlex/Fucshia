import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNewFellow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أضف تابع'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  File newProfilePic;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/person.jpg'),
          ),
          myFormFieldText('First name'),
          const SizedBox(height: 16.0),
          myFormFieldText('Last name'),
          const SizedBox(height: 16.0),
          myFormFieldText('Email'),
          const SizedBox(height: 16.0),
          myFormFieldText('Phone Number'),
          const SizedBox(height: 16.0),
          myFormFieldText('Addrees'),
          const SizedBox(height: 16.0),
          myFormFieldText('Address description'),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              OutlineButton(
                textColor: Colors.deepPurple,
                highlightColor: Colors.deepPurple,
                highlightedBorderColor: Colors.black,
//                onPressed: _submittable() ? _submit : null,
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submit() {
    formKey.currentState.validate();
    print('Form submitted');
  }

  Widget myFormFieldText(String name) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: name,
      ),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Nickname is required';
        }
      },
    );
  }
  Future getImage()async{
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      newProfilePic = tempImage;
    });
  }
}
