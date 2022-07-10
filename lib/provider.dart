import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class GlobalData {
  static String? userName;
  static String? gender;
  static int? contactNumber;
  static String? address;
  static String? birthDate;
  static String? section;
  static late bool exist = false;
  static late bool passCheck = false;
  static String? currentStudId;
  static String? currentStudPass;
  static String? storePass;

  fetchData() async {
    // var d = await db.collection("users").doc("184-0054").get();
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc("$currentStudId").get();
    Map<String, dynamic> data = docSnapshot.data()!;

    userName = data['name'];
    gender = data['gender'];
    contactNumber = data['number'];
    address = data['address'];
    birthDate = data['birthdate'];
    section = data['section'];

    print("Logged Student ID: $currentStudId");
    // for (var i in d.docs) {
    //   // ignore: avoid_print
    //   print(i.data());
    // }
  }

  static Future<bool> checkExist(String docID) async {
    // method to check if the user exists in the database

    try {
      await FirebaseFirestore.instance.doc("users/$docID").get().then((doc) {
        exist = doc.exists;
      });
      print('Searching Student ID');
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }

  static Future<bool> checkPass(String passArg) async {
    // method to check if the users password is correct
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc("$currentStudId").get();
    final Map<String, dynamic> map = docSnapshot.data() as Map<String, dynamic>;

    try {
      // passCheck = docSnapshot.data()!.containsValue(currentStudPass);
      // print('Checking Password');
      // return passCheck;
      passCheck = map['password'].toString().contains(passArg);
      return passCheck;
    } catch (e) {
      // If any error
      return false;
    }
  }
}
