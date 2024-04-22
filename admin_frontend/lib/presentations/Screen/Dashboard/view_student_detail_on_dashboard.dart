import 'package:admin/constants/ip.dart';
import 'package:admin/data/data_exports.dart';
import 'package:flutter/material.dart';

class ViewStudent extends StatelessWidget {
  final StudentModel student;
  ViewStudent({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Color.fromARGB(255, 21, 7, 103),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Student Profile",
                            textScaler: TextScaler.linear(3),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            "View Profile",
                            textScaler: TextScaler.linear(2),
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    // CircleAvatar(
                    //     backgroundColor: Colors.amber,
                    //     radius: 100,
                    //     backgroundImage:
                    //         NetworkImage("${ip()}${student.image}")),
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.only(right: 100),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          image: DecorationImage(
                              image: NetworkImage(
                                "${ip()}${student.image}",
                              ),
                              fit: BoxFit.contain)),
                    ),
                    Text(
                      student.full_name!,
                      textScaler: TextScaler.linear(2),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal details",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Name:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.full_name!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Date of birth:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.dob!),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            "Gender:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.gender!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Contact Number:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.contactNumber!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email Address:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.email!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Address:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.address!),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Academic details",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Year:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.year!.name!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Faculty:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.faculty!.name!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Section:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.section!.name!),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            "College mail:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.collegeMail!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Join date:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.joinDate!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Join date:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(student.joinDate!),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
