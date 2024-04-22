import 'package:admin/data/data_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/routine.dart';
import 'package:admin/presentations/Screen/Faculty/edit_faculty.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/delete_button.dart';
import 'package:flutter/material.dart';

class ViewFaculty extends StatelessWidget {
  final List<FacultyModel> faculties;
  ViewFaculty({super.key, required this.faculties});

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
              'Faculty',
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
            for (FacultyModel facultyModel in this.faculties)
              DataRow(cells: [
                DataCell(Text(facultyModel.name!)),
                DataCell(Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => EditFaculty()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: MyButton(text: 'Edit', color: Colors.orange),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Routinescreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child:
                            MyButton(text: 'View Routine', color: Colors.green),
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
