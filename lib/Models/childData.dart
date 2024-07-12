import 'package:flutter/material.dart';

// Map<String, dynamic> childData = {
//   "id": 0,
//   "firstName": "John",
//   "lastName": "Doe",
//   "gender": "MALE"
// };


class Child {
  String firstName;
  String lastName;
  String gender;

  Child({
    required this.firstName,
    required this.lastName,
    required this.gender,
  });

  static List<Child> children = [];

  static List<Map<String,dynamic>> Childs = [];

  Map<String, dynamic> childInput() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
    };
  }


  // childToList(){
  //   children.add(childInput());
  // }

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
    );
  }
}

