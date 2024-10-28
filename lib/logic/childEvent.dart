import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/widgets.dart';
import '../stateManagement/providers.dart';

// Function to convert List<dynamic> (time arrays) into DateTime
// DateTime createDateTime(List<dynamic> timeData) {
//   return DateTime(
//     timeData[0], // year
//     timeData[1], // month
//     timeData[2], // day
//     timeData.length > 3 ? timeData[3] : 0, // hour
//     timeData.length > 4 ? timeData[4] : 0, // minute
//     timeData.length > 5 ? timeData[5] : 0, // second
//   );
// }

// DateTime createTime(List<dynamic> timeData) {
//   return DateTime(
//     timeData[0], // hour
//     timeData[1], // minutes
//     timeData[2], // seconds
//   );
// }


DateTime createDateTime(List<dynamic> timeData) {
  if (timeData.length == 3) {
    // Assume hour, minute, second as current if only year, month, and day are provided
    final now = DateTime.now();
    return DateTime(
        now.year,
        now.month,
        now.day,
        timeData[0], // year
        timeData[1], // month
        timeData[2], // day
    );
  } else {
    // Use all provided values
    return DateTime(
        timeData[0], // year
        timeData[1], // month
        timeData[2], // day
        timeData[3], // hour
        timeData[4], // minute
        timeData[5]  // second
    );
  }
}


// Function to format time as 'h:mm am/pm'
String formatTime(List<dynamic> timeData, context) {
  final dateProvider = Provider.of<MainState>(context, listen: true);

  final DateTime dateTime = createDateTime(timeData);

  if (timeData.length == 6) {
    // Format as "dd MMM h:mm am/pm" (e.g., "26 Feb 2:17 pm")
    dateProvider.day = DateFormat('d').format(dateTime);
    dateProvider.month = DateFormat('MMM').format(dateTime);
  }

  return DateFormat('h:mm a').format(dateTime).toLowerCase(); // Format time to small "am/pm"
}

// String getTime(List<dynamic> timeData) {
//   int hour = timeData[0];
//   int minute = timeData[1];
//   int second = timeData[2];
//
//   String period = hour >= 12 ? 'pm' : 'am';
//   hour = hour % 12 == 0 ? 12 : hour % 12; // Convert 24-hour format to 12-hour
//
//   String formattedTime = '${hour.toString().padLeft(2, '0')}:'
//       '${minute.toString().padLeft(2, '0')} $period';
//
//   return formattedTime;
// }



// Function to get the sorted list of events with times
List<Map<String, dynamic>> getSortedReports(Map<String, dynamic> eventData) {
  List<Map<String, dynamic>> reports = [];

  // Check-in time
  if (eventData['checkInDateTime'] != null) {
    reports.add({
      'type': 'Check In Time',
      'time': eventData['checkInDateTime'],
    });
  }

  // Meal Reports
  eventData['mealReports']?.forEach((mealReport) {
    reports.add({
      'type': 'Meal Time',
      'time': mealReport['time'],
      'details': '${mealReport['quantity'] ?? 'Unknown Quantity'}',
    });
  });

  // Physical Activity Reports
  eventData['physicalActivityReports']?.forEach((activityReport) {
    reports.add({
      'type': 'Physical Activities',
      'time': activityReport['localTime'],
      'details': activityReport['activities']?.join(', ') ?? 'Unknown Activity',
    });
  });

  // Diaper Reports
  eventData['diaperReports']?.forEach((diaperReport) {
    reports.add({
      'type': 'Diaper Time',
      'time': diaperReport['localTime']
    });
  });

  // Snack Reports
  eventData['snackReports']?.forEach((snackReport) {
    reports.add({
      'type': 'Snack Time',
      'time': snackReport['localTime'],
      'details': snackReport['snacks']?.join(', ') ?? 'Unknown Snacks',
    });
  });

  // Nap Reports
  eventData['napReports']?.forEach((napReport) {
    reports.add({
      'type': 'Nap Time',
      'time': napReport['time']
    });
  });

  // Story Reports
  eventData['storyReports']?.forEach((storyReport) {
    reports.add({
      'type': 'Story Time',
      'time': storyReport['localTime']
    });
  });

  // Art and Crafts Reports
  eventData['artAndCraftsReports']?.forEach((artReport) {
    reports.add({
      'type': 'Arts and Crafts',
      'time': artReport['localTime']
    });
  });

  // Sort the reports by time
  reports.sort((a, b) {
    final timeA = createDateTime(a['time']);
    final timeB = createDateTime(b['time']);
    return timeA.compareTo(timeB);
  });

  return reports;
}

Widget buildEventReportColumn(Map<String, dynamic> eventData, BuildContext context) {
  // Get the sorted reports
  final sortedReports = getSortedReports(eventData);

  // // Reverse the sortedReports list to display from bottom to top
  // final reversedReports = sortedReports.reversed.toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: sortedReports.map<Widget>((report) {
      return tracker(
        type: report['type'] == 'Check In Time' ? 'assets/icons/CheckIn.svg' :
        report['type'] == 'Meal Time' ? 'assets/icons/MealTime.svg' :
        report['type'] == 'Physical Activities' ? 'assets/icons/Physical Acts.svg' :
        report['type'] == 'Diaper Time' ? 'assets/icons/Diaper Time.svg' :
        report['type'] == 'Snack Time' ? 'assets/icons/MealTime.svg' :
        report['type'] == 'Nap Time' ? 'assets/icons/Nap Time.svg' :
        report['type'] == 'Story Time' ? 'assets/icons/BookTime.svg' :
        report['type'] == 'Arts and Crafts' ? 'assets/icons/ArtsCrafts.svg' :
        'assets/icons/PlayTime.svg',
        head: report['type'],
        time: formatTime(report['time'], context),
        subhead: report['details'],
      );
    }).toList(),
  );
}


// StreamBuilder to listen for updates and display in a Column
// StreamBuilder eventReportStreamBuilder(Stream<Map<String, dynamic>> eventStream) {
//   return StreamBuilder<Map<String, dynamic>>(
//     stream: eventStream,
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator();
//       } else if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       } else if (snapshot.hasData) {
//         final eventData = snapshot.data!;
//         return buildEventReportColumn(eventData);
//       } else {
//         return Text('No data available');
//       }
//     },
//   );
// }




