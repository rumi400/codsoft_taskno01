

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Common {
  static Future<DateTime> showMyDatePicker(BuildContext context) async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1922),
        lastDate: DateTime(2122));
    date?.millisecondsSinceEpoch;
    print(date);
    if (date != null) {
      return date;
    } else {
      return DateTime.now();
    }
  }

  static Future<DateTime?> showMyTimePicker(BuildContext context) async {
    var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime.now())

    );
    if (time != null) {
      return DateTime(time as int);
    } else {
      return  DateTime(TimeOfDay.now() as int);
    }
  }

  static  Future selectTime ({required BuildContext context,required Function(String) callBack}) async{

    var t = DateTime.now();
    var time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(t)
    );
    if(time != null)
    {
      callBack(time.format(context).toString());

    }
  }


  static String getFormattedDate(DateTime dateTime) {
    return DateFormat("dd-MMM-yyyy").format(dateTime);
  }

  static showMyDialog(
      {required BuildContext context, required Function() onPressed}) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Do You want to delete this Project?"),
            actions: [
              TextButton(
                  onPressed: () {
                    onPressed();
                    Navigator.pop(context);
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }

  static showMyTaskDialog(
      {required BuildContext context, required Function() onPressed}) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Do You want to delete this Task?"),
            actions: [
              TextButton(
                  onPressed: () {
                    onPressed();
                    Navigator.pop(context, false);
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }

  static signOutDialog(
      {required BuildContext context, required Function() onPressed}) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Sign Out"),
            content: const Text("Do You want to Sign out from the App?"),
            actions: [
              TextButton(
                  onPressed: () {
                    onPressed();
                    // Navigator.pop(context);
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }

  static showSnackBar(
      {required BuildContext context, required String message}) async {
    SnackBar snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  static bool validateEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool validatePassword(String value) {
    bool check = true;
    RegExp regex = RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.*?[0-9]).{8,}$');

    if (!regex.hasMatch(value)) {
      check = false;
    }

    return check;
  }
}

enum MessageType { success, error, info }
