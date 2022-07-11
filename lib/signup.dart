// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stud_app/dashboard.dart';
import 'package:stud_app/login.dart';
import 'package:stud_app/main.dart';
import 'package:stud_app/provider.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final List<String> itemsSection = [
    'Section 1',
    'Section 2',
    'Section 3',
    'Section 4',
    'Section 5',
    'Section 6',
    'Section 7',
    'Section 8',
  ];

  final List<String> itemsGender = [
    'Male',
    'Female',
  ];
  String? selectedValueSection;
  String? selectedValueGender;

  late DateTime _selectedDate;
  late final TextEditingController _birthdate = TextEditingController();
  late final TextEditingController _name = TextEditingController();
  late final TextEditingController _section = TextEditingController();
  late final TextEditingController _address = TextEditingController();
  late final TextEditingController _gender = TextEditingController();
  late final TextEditingController _number = TextEditingController();
  late final TextEditingController _password = TextEditingController();
  late final TextEditingController _studIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:
            Text('Register to Portal', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Fill out the Form 📝',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                // const Text(
                //   'Student Number are auto generated.',
                //   // ignore: unnecessary_const
                //   style: const TextStyle(
                //     fontSize: 15,
                //   ),
                // ),
                // const SizedBox(height: 10.0),
                //email textfield

                // Full Name TextField

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _name,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.person),
                            hintText: 'Full Name (e.g. Juan Dela Cruz)'),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10.0),

                // Section Text Field

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: DropdownButton2(
                      searchController: _section,
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.list,
                            size: 20,
                            color: Color.fromARGB(221, 94, 91, 91),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              'Select Section',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(221, 44, 43, 43),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: itemsSection
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(221, 44, 43, 43),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValueSection,
                      onChanged: (value) {
                        setState(() {
                          selectedValueSection = value as String;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      iconEnabledColor: Colors.blue,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 250,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        color: Colors.grey[200],
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 100,
                      dropdownWidth: 300,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey[200],
                      ),
                      dropdownElevation: 0,
                      scrollbarRadius: const Radius.circular(14),
                      scrollbarThickness: 4,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                ),

                const SizedBox(height: 10.0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _address,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.location_on),
                            hintText: 'Complete Address'),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10.0),

                // Complete Address Textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.calendar_today),
                            hintText: 'Birth Date'),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _birthdate,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10.0),

                // Contact Number Textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: DropdownButton2(
                      searchController: _gender,
                      isExpanded: true,
                      hint: Row(
                        children: const [
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            Icons.list,
                            size: 20,
                            color: Color.fromARGB(221, 94, 91, 91),
                          ),
                          // Icon(
                          //   Icons.male_rounded,
                          //   size: 10,
                          //   color: Color.fromARGB(221, 94, 91, 91),
                          // ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              'Select Gender',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color.fromARGB(221, 44, 43, 43),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: itemsGender
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(221, 44, 43, 43),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: selectedValueGender,
                      onChanged: (value) {
                        setState(() {
                          selectedValueGender = value as String;
                        });
                      },
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      iconEnabledColor: Colors.blue,
                      iconDisabledColor: Colors.grey,
                      buttonHeight: 50,
                      buttonWidth: 250,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        color: Colors.grey[200],
                      ),
                      buttonElevation: 2,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: 100,
                      dropdownWidth: 300,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.grey[200],
                      ),
                      dropdownElevation: 0,
                      scrollbarRadius: const Radius.circular(14),
                      scrollbarThickness: 4,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 0),
                    ),
                  ),
                ),

                const SizedBox(height: 10.0),

                // Contact Number Textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _number,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.phone_rounded),
                            hintText: 'Contact Number'),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10.0),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        obscuringCharacter: '●',
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.security),
                            hintText: 'Create a Password'),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Confirm Password Textfield

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _studIdController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.verified_user_outlined),
                            hintText: 'Student ID: (e.g. 184-0054)'),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      EasyLoading.instance.indicatorType =
                          EasyLoadingIndicatorType.fadingCircle;
                      EasyLoading.show(
                        status: 'Creating Account',
                        maskType: EasyLoadingMaskType.black,
                      );
                      var collection =
                          FirebaseFirestore.instance.collection('users');
                      collection
                          .doc('${_studIdController.text}') // <-- Document ID
                          .set({
                        'name': _name.text,
                        'gender': selectedValueGender.toString(),
                        'birthdate': _birthdate.text,
                        'address': _address.text,
                        'password': _password.text,
                        'section': selectedValueSection.toString(),
                        'number': int.tryParse(_number.text),
                      }).then(
                        (_) => Timer(
                          const Duration(seconds: 3),
                          () async {
                            GlobalData().fetchData();
                            EasyLoading.showSuccess('Registration Successful',
                                duration: const Duration(seconds: 2),
                                maskType: EasyLoadingMaskType.black);
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString(
                                'id', '${GlobalData.currentStudId}');
                            debugPrint(
                                'Display ID: ${prefs.get('id').toString()}');
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                              (Route<dynamic> route) => false,
                            )
                                // debugPrint('Data Added'));
                                .catchError(
                              (error) => Timer(
                                const Duration(seconds: 3),
                                () {
                                  EasyLoading.showError('Registration Failed',
                                      maskType: EasyLoadingMaskType.black);
                                  print(
                                      'Registration Failed with Errors: $error');
                                },
                              ),
                            );
                            // debugPrint('Add failed: $error'));
                          },
                        ),
                      );
                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Dashboard()),
                      //   (Route<dynamic> route) => false,
                      // );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      'Report a Problem?',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14.0),
                    ),
                    const Text(
                      ' Contact Us',
                      style: TextStyle(color: Colors.blue, fontSize: 14.0),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1, 17, 30),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.blue, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _birthdate
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _birthdate.text.length, affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
