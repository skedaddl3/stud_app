import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:stud_app/settings_page.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  bool showPassword = false;
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
                  builder: (BuildContext context) => SettingsPage()));
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
                height: 35,
              ),
              buildTextField("Full Name", "Dor Alex", false),
              buildTextField("E-mail", "alexd@gmail.com", false),
              buildTextField("Gender", "TLV, Israel", false),
              buildTextField("Contact Number", "TLV, Israel", false),
              buildTextField("Address", "TLV, Israel", false),
              buildTextField("Password", "********", true),

              const SizedBox(
                height: 35,
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
                    onPressed: () {},
                    color: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "Save",
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
