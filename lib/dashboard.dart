import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:stud_app/course_details2.dart';
import 'package:stud_app/course_details3.dart';
import 'package:stud_app/report_card.dart';
import 'package:stud_app/report_card2.dart';
import 'package:stud_app/report_card3.dart';
import 'course_details.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List courses = [
    'Pentesting',
    'Bun Modern JavaScript Runtime',
    'Web Design Bundle',
  ];

  List percentage = [
    0.7,
    0.5,
    0.3,
  ];

  List textPercentage = [
    '70%',
    '50%',
    '30%',
  ];

  List route = [
    const CourseDetails(),
    const CourseDetailsSec(),
    const CourseDetailsThird(),
  ];

  List routeGrades = [
    const GradeDetails(),
    const GradeDetailsSec(),
    const GradeDetailsThird(),
  ];

  List textSubj = [
    'Operating System, Linux, Kali Distro',
    'Bun Modern Javascript RunTime',
    'Web Design Bundle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 166, 248),
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: CircleAvatar(
                backgroundImage:
                    const NetworkImage('https://i.pravatar.cc/100'),
                backgroundColor: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'subjects'.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        // ignore: prefer_const_constructors
                        BoxShadow(
                          color: const Color.fromARGB(255, 224, 222, 222),
                          offset: const Offset(0, 0),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.white.withAlpha(50),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => route[index],
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/subj/$index.jpg',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      courses[index].toString().toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Text(
                                      '${textSubj[index]}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                      height: 5,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 15),
                                            child: LinearPercentIndicator(
                                              animation: true,
                                              lineHeight: 5.0,
                                              animationDuration: 2500,
                                              percent: percentage[index],
                                              backgroundColor: Colors.grey[200],
                                              linearStrokeCap:
                                                  LinearStrokeCap.roundAll,
                                              progressColor: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text('${textPercentage[index]}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              'grades'.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        // ignore: prefer_const_constructors
                        BoxShadow(
                          color: const Color.fromARGB(255, 224, 222, 222),
                          offset: const Offset(0, 0),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.white.withAlpha(50),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => routeGrades[index],
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                // child: Image.asset(
                                //   'assets/images/grade.jpg',
                                //   fit: BoxFit.cover,
                                //   width: double.infinity,
                                // ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      courses[index].toString().toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                    ),
                                    // ignore: prefer_const_constructors
                                    Text(
                                      '${textSubj[index]}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                      height: 10,
                                    ),
                                    // Row(
                                    //   children: <Widget>[
                                    //     Expanded(
                                    //       child: Container(
                                    //         margin: const EdgeInsets.only(
                                    //             right: 15),
                                    // child: LinearPercentIndicator(
                                    //   animation: true,
                                    //   lineHeight: 5.0,
                                    //   animationDuration: 2500,
                                    //   percent: percentage[index],
                                    //   backgroundColor: Colors.grey[200],
                                    //   linearStrokeCap:
                                    //       LinearStrokeCap.roundAll,
                                    //   progressColor: Theme.of(context)
                                    //       .primaryColor,
                                    // ),
                                    //   ),
                                    // ),
                                    // Column(
                                    //     // children: <Widget>[
                                    //     //   Text('${textPercentage[index]}'),
                                    //     // ],
                                    //     ),
                                    // ],
                                    // ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
