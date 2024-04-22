import 'package:admin/presentations/Screen/search/searchScreenTeacher.dart';
import 'package:flutter/material.dart';

class SearchScreenTeacherText extends StatelessWidget {
  SearchScreenTeacherText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildSectionTitle(context)],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/banner.png",
          scale: 2.5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 500),
          child: Align(
            widthFactor: MediaQuery.of(context).size.width / 6,
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                isDense: true,
                border: OutlineInputBorder(),
                hintText: "Search teacher",
                suffixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              onSubmitted: (value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SearchScreenTeacher(
                              data: value,
                            )));
              },
            ),
          ),
        )
      ],
    );
  }

  // Widget _buildStudentDetails() {
  //   return Padding(
  //     padding: EdgeInsets.all(8.0),
  //     child: DataTableStudent(),
  //   );
  // }
}
