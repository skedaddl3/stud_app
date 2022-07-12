// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class GradeDetails extends StatefulWidget {
  const GradeDetails({Key? key}) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<GradeDetails> {
  List chapters = [
    'Introduction to OS',
    'Operating System',
    'Linux',
    'Kali Linux',
  ];

  List topics = [
    'Introduction to OS',
    'Detailed Introduction to OS',
    'Linux and its Distros',
    'What is Kali Linux',
    'Linux Commands',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 166, 248),
      appBar: AppBar(
        title:
            Text('Virtual Report Card', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Penetration Testing'.toUpperCase(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                backgroundImage:
                    Image.asset('assets/images/instructor/Linus Torvalds.jpeg')
                        .image,
                backgroundColor: Colors.grey[300],
              ),
              title: Text(
                'Linus Torvalds',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Lead Instructor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.location_city,
                color: Colors.white,
                size: 40.0,
              ),
              title: Text(
                'Room Location:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '3rd Floor North Building, Room #3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.schedule,
                color: Colors.white,
                size: 40.0,
              ),
              title: Text(
                'Schedule:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Mon-Wed-Fri  9:00 am - 12:15 pm',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.info_outline,
                color: Colors.white,
                size: 40.0,
              ),
              title: Text(
                'Grades shown is for Current/Recent Semester',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '2 - 3 weeks process to see the updated Grades after semester ends',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Icon(
                Icons.message,
                color: Colors.white,
                size: 40.0,
              ),
              title: Text(
                'If Grades are blank, contact your Instructor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Or just wait for the grades being processed.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chapters.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 224, 224, 224),
                          offset: Offset(0, 0),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    // child: ListTile(
                    //   leading: Container(
                    //     padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    //     child: Text(
                    //       '$index',
                    //       style: TextStyle(
                    //         color: Theme.of(context).primaryColor,
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    //   title: Text(
                    //     chapters[index].toString().toUpperCase(),
                    //     style: TextStyle(
                    //       color: Colors.blue,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     topics[index],
                    //     style: TextStyle(
                    //       color: Colors.grey,
                    //       fontSize: 14,
                    //     ),
                    //   ),
                    //   trailing: Icon(
                    //     Icons.chevron_right,
                    //     size: 18,
                    //     color: Theme.of(context).primaryColor,
                    //   ),
                    // ),
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
