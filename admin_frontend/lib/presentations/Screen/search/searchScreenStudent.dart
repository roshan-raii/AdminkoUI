import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:flutter/material.dart';

class SearchScreenStudent extends StatelessWidget {
  final String data;
  SearchScreenStudent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildSectionTitle(context), _buildSearched()],
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

  Widget _buildSearched() {
    return Column(
      children: [Text(data), DataTableStudentSearchResult()],
    );
  }
}
