import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stud_app/provider.dart';
import 'package:stud_app/settings_page.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  bool showPassword = false;
  var db = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit Profile'),
        backgroundColor: Colors.blue,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              // const Text(
              //   "Edit Profile",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/images/user_icon1.png'))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.grey,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // RaisedButton(
              //   child: Text('get data'),
              //   onPressed: () {
              //     GlobalData().fetchData();
              //     print("Obtaining Data");
              //   },
              // ),

              // StreamBuilder<Object>(
              //     stream: FirebaseFirestore.instance
              //         .collection('users')
              //         .doc('184-0054')
              //         .snapshots(),
              //     builder: (context, snapshot) {
              //       if (!snapshot.hasData) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }

              //     }),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '${GlobalData.userName}',
                  hintText: 'Name',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _sectionController,
                decoration: InputDecoration(
                  labelText: '${GlobalData.section}',
                  hintText: 'Section',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _genderController,
                decoration: InputDecoration(
                  labelText: '${GlobalData.gender}',
                  hintText: 'Gender',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Number',
                  labelText: '${GlobalData.contactNumber.toString()}',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: '${GlobalData.address}',
                  hintText: 'Address',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: '${GlobalData.currentStudPass}',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),

              TextField(
                controller: _birthdateController,
                decoration: InputDecoration(
                  hintText: 'Birth Date',
                  labelText: '${GlobalData.birthDate}',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),

              // buildTextField("Section", "${GlobalData.section}", false),
              // buildTextField("Gender", "${GlobalData.gender}", false),
              // buildTextField("Contact Number",
              //     "${GlobalData.contactNumber.toString()}", false),
              // buildTextField("Address", "${GlobalData.address}", false),
              // buildTextField("Password", "${GlobalData.currentStudPass}", true),
              // buildTextField("BirthDate", "${GlobalData.birthDate}", false),

              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {},
                    child: const Text("Cancel",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  // padding: const EdgeInsets.symmetric(horizontal: 50),

                  RaisedButton(
                    onPressed: () {
                      if (_nameController.text == "") {
                        _nameController.text = GlobalData.userName!;
                      }
                      if (_genderController.text == "") {
                        _genderController.text = GlobalData.gender!;
                      }
                      if (_birthdateController.text == "") {
                        _birthdateController.text = GlobalData.birthDate!;
                      }
                      if (_addressController.text == "") {
                        _addressController.text = GlobalData.address!;
                      }
                      if (_sectionController.text == "") {
                        _sectionController.text = GlobalData.section!;
                      }
                      if (_numberController.text == "") {
                        _numberController.text =
                            GlobalData.contactNumber.toString();
                      }
                      if (_passwordController.text == "") {
                        _passwordController.text = GlobalData.currentStudPass!;
                      }
                      var users =
                          FirebaseFirestore.instance.collection('users');
                      users
                          .doc('${GlobalData.currentStudId}')
                          .update({
                            'name': _nameController.text,
                            'gender': _genderController.text,
                            'birthdate': _birthdateController.text,
                            'address': _addressController.text,
                            'password': _passwordController.text,
                            'section': _sectionController.text,
                            'number': int.tryParse(_numberController.text),
                          }) // <-- Updated data
                          .then((_) => debugPrint('Success'))
                          .catchError((error) => debugPrint('Failed: $error'));
                    },
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Update",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
