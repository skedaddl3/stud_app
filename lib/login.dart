import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputType;
import 'package:stud_app/provider.dart';

import 'dashboard.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _LogInPageState();
}

class _LogInPageState extends State<SecondRoute> {
  late final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title:
            const Text('Login Portal', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              const Text(
                'Stay on Track 👨‍🏫',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Log Into Your Account',
                // ignore: unnecessary_const
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 45.0),
              //email textfield

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                      controller: _nameController,
                      keyboardType: TextInputType.number,
                      onChanged: (content) {
                        GlobalData.checkExist(_nameController.text);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Student ID'),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // ignore: prefer_const_constructors
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: const TextField(
                      obscureText: true,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Password'),
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: GestureDetector(
                  onTap: () {
                    GlobalData.checkExist(_nameController
                        .text); // Second call since exist is not initialized
                    if (GlobalData.exist == true) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()),
                        (Route<dynamic> route) => false,
                      );
                      print('Student ID found');
                    } else if (GlobalData.exist == false) {
                      print('Student ID doesnt exist');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
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
                    'Forgot Password?',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14.0),
                  ),
                  const Text(
                    ' Click Here to Reset',
                    style: TextStyle(color: Colors.blue, fontSize: 14.0),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
