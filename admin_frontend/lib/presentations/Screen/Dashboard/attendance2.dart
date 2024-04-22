import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:flutter/material.dart';

class ViewAttendance2 extends StatelessWidget {
  const ViewAttendance2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [_buildSectionTitle(), _buildRoutine()],
        ));
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

  Widget _buildRoutine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataTableStudentAttendance2(),
      ],
    );
  }
}
