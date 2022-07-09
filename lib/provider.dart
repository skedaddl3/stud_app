import 'package:cloud_firestore/cloud_firestore.dart';

class GlobalData {
  static String? userName;
  static String? gender;
  static int? contactNumber;
  static String? address;
  static String? birthDate;
  static String? section;
  static late bool exist;
  static String? currentStudId;

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
      return exist;
    } catch (e) {
      // If any error
      return false;
    }
  }
}
