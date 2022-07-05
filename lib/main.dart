import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:stud_app/signup.dart' show Signup;
import 'package:stud_app/login.dart' show SecondRoute;

void main() {
  runApp(
    MaterialApp(
      title: 'Student Demo',
      theme: ThemeData(
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(color: const Color.fromRGBO(252, 252, 252, 1)),
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Montfort Academy - Student Portal',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
        centerTitle: true,
      ),
      // ignore: prefer_const_constructors
      body: const LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(color: Colors.black, fontSize: 15);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
            child: Image.asset('assets/images/Montfort-removebg-preview.png'),
            width: 200),
        const Text("\n\n"),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: defaultStyle,
            children: <TextSpan>[
              const TextSpan(text: 'Currently Enrolled Student? '),
              TextSpan(
                  text: 'Login Here',
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondRoute()),
                      );
                      // ignore: avoid_print
                      print('login page');
                    }),
              const TextSpan(text: '\n\nHaving Troubles Logging In? '),
              TextSpan(
                  text: 'Create an account or Report a Problem',
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // ignore: avoid_print.
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                      // ignore: avoid_print
                      print('Sign Up/Report a Problem');
                    }),
            ],
          ),
        )
      ],
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}
