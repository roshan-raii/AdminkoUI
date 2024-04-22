import 'package:admin/constants/ip.dart';
import 'package:admin/data/data_exports.dart';
import 'package:flutter/material.dart';

class ViewTeacher extends StatelessWidget {
  final TeacherModel teacherModel;
  ViewTeacher({super.key, required this.teacherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            "Teacher Profile",
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
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 100,
                      backgroundImage:
                          NetworkImage("${ip()}${teacherModel.image}"),
                    ),
                    Text(
                      teacherModel.full_name!,
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
                          Text(teacherModel.full_name!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Date of birth:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.dob!),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            "Gender:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.gender!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Contact Number:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.contactNumber!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Email Address:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.email!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Address:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.address!),
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
                            "Professional details",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Faculty:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Experience:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.experience!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Qualification:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.qualification!),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Join date:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.joinDate!),
                          SizedBox(
                            height: 9,
                          ),
                          Text(
                            "College mail:",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(teacherModel.collegeMail!),
                          SizedBox(
                            height: 10,
                          ),
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
