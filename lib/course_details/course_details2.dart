// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CourseDetailsSec extends StatefulWidget {
  const CourseDetailsSec({Key? key}) : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetailsSec> {
  List chapters = [
    'Introduction to Bun',
    'Bun JavaScript RunTime Environment',
    'Bun JavaScript Core Engine',
    'Getting Started with Bun',
  ];

  List topics = [
    'Introduction to Bun',
    'BUN JRE',
    'Bun JavaScript Core Engine / ZIG',
    'Installation and Usage',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 66, 166, 248),
      appBar: AppBar(
        title: Text('Course Details', style: TextStyle(color: Colors.white)),
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
              'Bun Modern JavaScript Runtime'.toUpperCase(),
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
                    Image.asset('assets/images/instructor/Jarred Sumner.jpeg')
                        .image,
                backgroundColor: Colors.grey[300],
              ),
              title: Text(
                'Jarred Sumner',
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
                '4th Floor North Building, Room #9',
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
                'Tue-Thu  10:00 am - 11:00 pm',
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
                    child: ListTile(
                      leading: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text(
                          '$index',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        chapters[index].toString().toUpperCase(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        topics[index],
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        size: 18,
                        color: Theme.of(context).primaryColor,
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
