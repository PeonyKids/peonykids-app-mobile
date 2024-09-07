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

      // Add 'isChecked' key with default value false
      item['isChecked'] = false;

      // // Add 'active' key with default value false
      // item['active'] = false;

      item['dateOfBirth'] = item['dateOfBirth'] ?? [];

      return item;
    }).toList();
  }


  List<Map<String, dynamic>> getProcessedData() {
    return childrenList;
  }
}


class ReportSummary {
  final String message;
  final String mood;
  final String reportId;

  ReportSummary({required this.message, required this.mood, required this.reportId});

  factory ReportSummary.fromJson(Map<String, dynamic> json) {
    return ReportSummary(
      message: json['message'],
      mood: json['mood'],
      reportId: json['id'],
    );
  }
}


class MealReport {
  final String id;
  final String mealName;
  final String formattedTime; // Store formatted time as a string
  final String quantity;
  final String? reportType;

  MealReport({
    required this.id,
    required this.mealName,
    required this.formattedTime,
    required this.quantity,
    this.reportType,
  });

  factory MealReport.fromJson(Map<String, dynamic> json) {
    return MealReport(
      id: json['id'],
      mealName: json['mealName'],
      formattedTime: _formatTime(List<int>.from(json['time'])),
      quantity: json['quantity'],
      reportType: json['reportType'],
    );
  }

  static String _formatTime(List<int> time) {
    if (time.length != 3) {
      throw ArgumentError('Time list must have exactly 3 elements: [hour, minute, second]');
    }

    int hour = time[0];
    int minute = time[1];

    // Determine AM or PM
    String period = hour >= 12 ? 'PM' : 'AM';

    // Convert hour from 24-hour to 12-hour format
    hour = hour % 12;
    if (hour == 0) {
      hour = 12; // Midnight or noon case
    }

    // Format minute to always be two digits
    String minuteStr = minute.toString().padLeft(2, '0');

    // Return the formatted time
    return '$hour:$minuteStr $period';
  }
}

class DiaperReport {
  final String id;
  final String formattedLocalTime; // Store formatted local time as a string
  final String diaperCondition;
  final String potty;
  final String reportType;

  DiaperReport({
    required this.id,
    required this.formattedLocalTime,
    required this.diaperCondition,
    required this.potty,
    required this.reportType,
  });

  factory DiaperReport.fromJson(Map<String, dynamic> json) {
    return DiaperReport(
      id: json['id'],
      formattedLocalTime: MealReport._formatTime(List<int>.from(json['localTime'])),
      diaperCondition: json['diaperCondition'],
      potty: json['potty'],
      reportType: json['reportType'],
    );
  }
}



