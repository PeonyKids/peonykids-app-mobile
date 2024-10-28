import 'package:PeonyKids/Styles/colors.dart';
import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showCustomErrorSnackBar({required String message}) {
    final snackBar = SnackBar(
      backgroundColor: statusError,
      content: Row(
        children: [
          Icon(Icons.block, color: white), // Circle with a slash
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Error!',
                  style: TextStyle(
                    fontSize: 16,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style:TextStyle(
                      fontSize: 14,
                      color: white,
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      action: SnackBarAction(
        label: 'ㄨ', // The "X" to dismiss
        textColor: white,
        onPressed: () {
          // Dismiss the SnackBar when 'X' is pressed
          messengerKey.currentState?.hideCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 2), // Auto dismiss after 4 seconds
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showCustomSuccessSnackBar({required String message}) {
    final snackBar = SnackBar(
      backgroundColor: statusSuccess,
      content: Row(
        children: [
          Icon(Icons.check_circle_outline_rounded, color: white), // Circle with a slash
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Success!',
                  style: TextStyle(
                    fontSize: 16,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style:TextStyle(
                    fontSize: 14,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      action: SnackBarAction(
        label: 'ㄨ', // The "X" to dismiss
        textColor: white,
        onPressed: () {
          // Dismiss the SnackBar when 'X' is pressed
          messengerKey.currentState?.hideCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 2), // Auto dismiss after 4 seconds
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showCustomPendingSnackBar({required String message}) {
    final snackBar = SnackBar(
      backgroundColor: statusPending,
      content: Row(
        children: [
          Icon(Icons.info_outline_rounded, color: white), // Circle with a slash
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pending!',
                  style: TextStyle(
                    fontSize: 16,
                    color: white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  message,
                  style:TextStyle(
                    fontSize: 14,
                    color: white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      action: SnackBarAction(
        label: 'ㄨ', // The "X" to dismiss
        textColor: white,
        onPressed: () {
          // Dismiss the SnackBar when 'X' is pressed
          messengerKey.currentState?.hideCurrentSnackBar();
        },
      ),
      duration: Duration(seconds: 2), // Auto dismiss after 4 seconds
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
