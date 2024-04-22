// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:admin/data/data_exports.dart';
import 'package:admin/presentations/Screen/Year/edit_year.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/delete_button.dart';
import 'package:flutter/material.dart';

class ViewYear extends StatelessWidget {
  List<YearModel> years;
  ViewYear({
    Key? key,
    required this.years,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          border: TableBorder.all(color: Colors.white),
          headingRowColor: MaterialStateProperty.resolveWith(
              (states) => Color.fromARGB(255, 16, 19, 101)),
          columns: [
            DataColumn(
                label: Text(
              'Year',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Actions',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            for (YearModel year in this.years)
              DataRow(cells: [
                DataCell(Text(year.name!)),
                DataCell(Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EditYear()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: MyButton(text: 'Edit', color: Colors.orange),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: DeleteButton(color: Colors.red),
                    ),
                  ],
                )),
              ]),
          ],
        ),
      ],
    );
  }
}
