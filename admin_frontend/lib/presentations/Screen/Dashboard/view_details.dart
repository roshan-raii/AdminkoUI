// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/presentations/Screen/Dashboard/add_user.dart';
import 'package:admin/presentations/Screen/Dashboard/view_detail_student.dart';
import 'package:admin/presentations/Screen/Dashboard/view_detail_teacher.dart';
import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  ViewDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          "assets/images/banner.png",
          scale: 2,
        ),
        SizedBox(
          height: 50,
        ),
        Center(
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ViewDetailsOfStudent()));
                },
                child: AddUserButton(label: "View Student"))),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => ViewDetailsOfTeacher())),
            child: AddUserButton(label: "View Teacher"))
      ],
    ));
  }
}
