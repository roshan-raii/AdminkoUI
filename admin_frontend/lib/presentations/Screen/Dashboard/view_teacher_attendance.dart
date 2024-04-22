import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:flutter/material.dart';

class ViewTeacherAttendance extends StatelessWidget {
  ViewTeacherAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildSectionTitle(), _buildTeacherAttendance()],
      ),
    );
  }

  Widget _buildSectionTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/banner.png",
          scale: 2.5,
        )
      ],
    );
  }

  Widget _buildTeacherAttendance() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DataTableStudent(),
    );
  }
}
