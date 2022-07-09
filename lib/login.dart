import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputType;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:stud_app/provider.dart';

import 'dashboard.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _LogInPageState();
}

class _LogInPageState extends State<SecondRoute> {
  Timer? _timer;
  late double _progress;
  late final TextEditingController _studIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    // EasyLoading.showSuccess('Use in initState');

    // EasyLoading.instance
    //   ..displayDuration = Duration(seconds: 1)
    //   ..indicatorType = EasyLoadingIndicatorType.dualRing
    //   ..animationDuration = Duration(seconds: 1);

    // EasyLoading.removeCallbacks();
  }

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
                      controller: _studIdController,
                      keyboardType: TextInputType.number,
                      onChanged: (content) {
                        GlobalData.checkExist(_studIdController.text);
                        GlobalData.currentStudId = _studIdController.text;
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
                  onTap: () async {
                    try {
                      EasyLoading.instance
                        ..indicatorType =
                            EasyLoadingIndicatorType.pouringHourGlass
                        ..displayDuration = const Duration(seconds: 2)
                        ..loadingStyle = EasyLoadingStyle.light
                        ..indicatorColor = Colors.blue
                        ..textColor = Colors.blue
                        ..backgroundColor = Colors.white;
                      _timer?.cancel();
                      await EasyLoading.show(
                        status: 'Searching Student ID Records',
                        maskType: EasyLoadingMaskType.black,
                      );

                      GlobalData.checkExist(_studIdController
                          .text); // Second call since exist is not initialized
                      if (GlobalData.exist == true) {
                        Timer(Duration(seconds: 3), () {
                          EasyLoading.showSuccess('Student ID Found!',
                              duration: const Duration(seconds: 2),
                              maskType: EasyLoadingMaskType.black);
                          Timer(Duration(seconds: 1), () {
                            EasyLoading.instance.indicatorType =
                                EasyLoadingIndicatorType.dualRing;
                            EasyLoading.show(
                              status: 'Logging In',
                              maskType: EasyLoadingMaskType.black,
                            );
                            Timer(Duration(seconds: 1), () {
                              EasyLoading.dismiss();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()),
                                (Route<dynamic> route) => false,
                              );
                            });
                          });

                          print('Student ID found');
                        });
                      } else if (GlobalData.exist == false) {
                        Timer(const Duration(seconds: 3), () {
                          EasyLoading.showError(
                              'Student ID not found! Make sure you are enrolled.',
                              maskType: EasyLoadingMaskType.black);
                          print('Student ID doesnt exist');
                        });
                      }
                    } on Exception catch (e) {
                      EasyLoading.showError(
                          'Please input valid credentials. $e');
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
