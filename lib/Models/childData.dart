// import 'package:flutter/material.dart';

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
  String dob;

  Child({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.dob,
  });

  static List<Child> children = [];

  static List<Map<String,dynamic>> Childs = [];

  Map<String, dynamic> childInput() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'dob' : dob
    };
  }


  // childToList(){
  //   children.add(childInput());
  // }

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'], dob: json['dob'],
    );
  }
}


class Children {
  List<Map<String, dynamic>> childrenList = [];


  Children(List<Map<String, dynamic>> rawData) {
    childrenList = rawData.map((item) {
      // Safeguard against null values or missing keys

      item['isChecked'] = false;
      // Add 'isChecked' key with default value false

      item['dateOfBirth'] = item['dateOfBirth'] ?? [];

      return item;
    }).toList();
  }


  List<Map<String, dynamic>> getProcessedData() {
    return childrenList;
  }
}


