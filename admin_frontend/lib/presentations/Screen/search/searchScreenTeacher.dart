import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:flutter/material.dart';

class SearchScreenTeacher extends StatelessWidget {
  final String data;
  SearchScreenTeacher({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildSectionTitle(context),
          _buildSearchResult(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/banner.png",
            scale: 2.5,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResult() {
    return Column(
      children: [Text(data), DataTableTeacherSearchResult()],
    );
  }
}
