// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stud_app/main.dart';
import 'package:stud_app/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          // ignore: prefer_const_constructors
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            // Text(
            //   "Settings",
            //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            // ),
            // SizedBox(
            //   height: 40,
            // ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Account",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Request Change Password"),
            buildAccountOptionRow(context, "Report Missing Student ID"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            buildAccountOptionRow1(context, "Delete Account"),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.volume_up_outlined,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Notifications",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New Subjects", false),
            buildNotificationOptionRow("Account activity", false),
            buildNotificationOptionRow("Grade Updates", false),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: OutlinedButton(
                // style: OutlinedButton.styleFrom(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(20)),
                // ),
                onPressed: () async {
                  debugPrint('Testing Button');
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  debugPrint('Removing ID: ${prefs.get('id').toString()}');
                  prefs.remove('id');
                  print(prefs.toString());
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text("Log Out",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),

              // padding: EdgeInsets.symmetric(horizontal: 40),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow1(BuildContext context, String title) {
    return GestureDetector(
      onTap: () async {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Delete Account'),
              content: const Text(
                  'This action cannot be undone. Are you sure you want to delete your account?'),
              actions: <Widget>[
                // ignore: unnecessary_new
                new FlatButton(
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop(
                        false); // dismisses only the dialog and returns false
                    final collection =
                        FirebaseFirestore.instance.collection('users');
                    collection
                        .doc(
                            '${GlobalData.currentStudId}') // <-- Doc ID to be deleted.
                        .delete() // <-- Delete
                        .then((_) => debugPrint('Deleted'))
                        .catchError(
                            (error) => debugPrint('Delete failed: $error'));
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    debugPrint('Removing ID: ${prefs.get('id').toString()}');
                    prefs.remove('id');
                    debugPrint(prefs.toString());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Yes'),
                ),
                FlatButton(
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop(
                        true); // dismisses only the dialog and returns true
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );

        // showAlertDialog(BuildContext context) {
        //   // set up the buttons
        //   Widget cancelButton = TextButton(
        //     child: const Text("Cancel"),
        //     onPressed: () {},
        //   );
        //   Widget continueButton = TextButton(
        //     child: const Text("Continue"),
        //     onPressed: () async {
        //       final collection = FirebaseFirestore.instance.collection('users');
        //       collection
        //           .doc(
        //               '${GlobalData.currentStudId}') // <-- Doc ID to be deleted.
        //           .delete() // <-- Delete
        //           .then((_) => debugPrint('Deleted'))
        //           .catchError((error) => debugPrint('Delete failed: $error'));
        //       SharedPreferences prefs = await SharedPreferences.getInstance();
        //       debugPrint('Removing ID: ${prefs.get('id').toString()}');
        //       prefs.remove('id');
        //       debugPrint(prefs.toString());
        //       Navigator.pushAndRemoveUntil(
        //         context,
        //         MaterialPageRoute(builder: (context) => const HomePage()),
        //         (Route<dynamic> route) => false,
        //       );
        //     },
        //   );

        //   // set up the AlertDialog
        //   AlertDialog alert = AlertDialog(
        //     title: const Text("AlertDialog"),
        //     content: const Text(
        //         "Are you sure you want to delete your account? This action cannot be undone."),
        //     actions: [
        //       cancelButton,
        //       continueButton,
        //     ],
        //   );

        //   // show the dialog
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return alert;
        //     },
        //   );
        // }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.folder_delete,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("Option 1 N/A"),
                    const Text("Option 2 N/A"),
                    const Text("Option 3 N/A"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
