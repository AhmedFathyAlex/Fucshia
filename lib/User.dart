import 'package:flutter/material.dart';

class User {
  String token = '';
  String userName = '';
  String imageUrl = '';
  String email = '';
  String firstName = '';
  String lastName = '';
  int id;
  int priority;
  String gender;

  User(
      {this.token,
      this.id,
      this.userName,
      this.imageUrl,
      this.email,
      this.firstName,
      this.lastName,
      this.priority,
      this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    var userMap = json['user'];
    return User(
      token: json['token'],
      userName: userMap['username'],
      imageUrl: userMap['userPicture'],
      email: userMap['email'],
    );
  }
  User.fromMapObject(Map<String, dynamic> map) {
    this.token = map['token'];
    this.gender = map['gender'];
    this.imageUrl = map['imagePath'];
    this.lastName = map['lastName'];
    this.firstName = map['firstName'];
    this.userName = map['fullName'];
    this.priority = map['priority'];
    this.email = map['email'];
    this.id = map['id'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['fullName'] = userName??'nulllll';
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['imagePath'] = imageUrl;
    map['gender'] = gender;
    map['token'] = token;
    map['priority'] = priority;
    map['email'] = email;
    return map;
  }
}
