import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/attendance2.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/delete_button.dart';
import 'package:admin/presentations/widgets/dropDown.dart';
import 'package:admin/presentations/Screen/Dashboard/editRoutine.dart';
import 'package:admin/presentations/Screen/Dashboard/editSubject.dart';
import 'package:admin/presentations/Screen/Dashboard/routine2.dart';
import 'package:admin/presentations/Screen/Dashboard/sectionScreen.dart';
import 'package:admin/presentations/Screen/Dashboard/view_subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataTableStudent extends StatelessWidget {
  DataTableStudent({super.key});

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
              'Stud_id',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Name',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Year',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Faculty',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Phone',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Email address',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Action',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            // DataRow(
            //   cells: [
            //     DataCell(Text('1')),
            //     DataCell(Text('Roshan Rai')),
            //     DataCell(Text('3rd Year')),
            //     DataCell(Text('Bsc(hons) Computing')),
            //     DataCell(Text('9829337338')),
            //     DataCell(Text('np05cp4s220045@iic.edu.np')),
            //     DataCell(Row(
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (_) => ViewStudent()));
            //           },
            //           child: Padding(
            //             padding: EdgeInsets.all(5.0),
            //             child: MyButton(text: 'View', color: Colors.lightGreen),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (_) => EditStudentDetails()));
            //           },
            //           child: Padding(
            //             padding: EdgeInsets.all(5.0),
            //             child: MyButton(text: 'Edit', color: Colors.orange),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(5.0),
            //           child: DeleteButton(color: Colors.red),
            //         ),
            //       ],
            //     )),
            //   ],
            // ),
            // DataRow(
            //   cells: [
            //     DataCell(Text('1')),
            //     DataCell(Text('Roshan Rai')),
            //     DataCell(Text('3rd Year')),
            //     DataCell(Text('Bsc(hons) Computing')),
            //     DataCell(Text('9829337338')),
            //     DataCell(Text('np05cp4s220045@iic.edu.np')),
            //     DataCell(Row(
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (_) => ViewStudent(student: stude,)));
            //           },
            //           child: Padding(
            //             padding: EdgeInsets.all(5.0),
            //             child: MyButton(text: 'View', color: Colors.lightGreen),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (_) => EditStudentDetails()));
            //           },
            //           child: Padding(
            //             padding: EdgeInsets.all(5.0),
            //             child: MyButton(text: 'Edit', color: Colors.orange),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(5.0),
            //           child: DeleteButton(color: Colors.red),
            //         ),
            //       ],
            //     )),
            //   ],
            // ),
            // DataRow(
            //   cells: [
            //     DataCell(Text('1')),
            //     DataCell(Text('Roshan Rai')),
            //     DataCell(Text('3rd Year')),
            //     DataCell(Text('Bsc(hons) Computing')),
            //     DataCell(Text('9829337338')),
            //     DataCell(Text('np05cp4s220045@iic.edu.np')),
            //     DataCell(Row(
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (_) => ViewStudent()));
            //           },
            //           child: Padding(
            //             padding: EdgeInsets.all(5.0),
            //             child: MyButton(text: 'View', color: Colors.lightGreen),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (_) => EditStudentDetails()));
            //           },
            //           child: Padding(
            //             padding: EdgeInsets.all(5.0),
            //             child: MyButton(text: 'Edit', color: Colors.orange),
            //           ),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.all(5.0),
            //           child: DeleteButton(color: Colors.red),
            //         ),
            //       ],
            //     )),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}

class DataTableTeacher extends StatelessWidget {
  DataTableTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      DataTable(
          border: TableBorder.all(color: Colors.white),
          headingRowColor: MaterialStateProperty.resolveWith(
              (states) => Color.fromARGB(255, 16, 19, 101)),
          columns: [
            DataColumn(
                label: Text(
              'Teacher id',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Name',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Module',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Address',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Phone',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Email Address',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Action',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [])
    ]);
  }
}

class DataTableRoutineOne extends StatelessWidget {
  DataTableRoutineOne({super.key});

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
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Section',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Action',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(BlocBuilder<RoutineDropdownLogicCubit,
                  RoutineDropdownLogicState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: DropdownButton(
                      // Initial Value
                      value: state.year,

                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: state.years!.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        context.read<RoutineDropdownLogicCubit>()
                          ..changeDropDownValue(newValue!);
                      },
                    ),
                  );
                },
              )),
              DataCell(DropDownAcademicSection()),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                          // MaterialPageRoute(builder: (_) => ViewRoutine2()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: MyButton(text: 'View', color: Colors.lightGreen),
                    ),
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

class DataTableYear extends StatelessWidget {
  DataTableYear({super.key});

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
              'Year',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Actions',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(DropDownFaculty()),
              DataCell(Text(
                '1st Year',
              )),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => SubjectScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: MyButton(
                              text: 'View Module', color: Colors.lightGreen)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => SectionScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: MyButton(
                          text: 'View Section', color: Colors.lightGreen),
                    ),
                  ),
                ],
              )),
            ]),
            DataRow(cells: [
              DataCell(DropDownFaculty()),
              DataCell(Text(
                '2nd Year',
              )),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => SubjectScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: MyButton(
                          text: 'View Module', color: Colors.lightGreen),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => SectionScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: MyButton(
                          text: 'View Section', color: Colors.lightGreen),
                    ),
                  ),
                ],
              )),
            ]),
            DataRow(cells: [
              DataCell(DropDownFaculty()),
              DataCell(Text(
                '3rd Year',
              )),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => SubjectScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: MyButton(
                              text: 'View Module', color: Colors.lightGreen)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => SectionScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: MyButton(
                          text: 'View Section', color: Colors.lightGreen),
                    ),
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

class DataTableSubject extends StatelessWidget {
  DataTableSubject({super.key});

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
              'Subject',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Start date',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'End date',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Description',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Actions',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(
                'Java',
              )),
              DataCell(Text("2/10/2024")),
              DataCell(Text("5/10/2024")),
              DataCell(Text("This is basic Java course")),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (_) => ViewSubject()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: MyButton(
                          text: 'View',
                          color: Color.fromARGB(255, 44, 209, 60)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EditSubject()));
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

class DataTableTeacherAssign extends StatelessWidget {
  DataTableTeacherAssign({super.key});

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
              'Subject',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Teacher',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Actions',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(
                'Java',
              )),
              DataCell(Text("Bikram Poudel")),
              DataCell(Row(
                children: [
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

class DataTableSectionScreen extends StatelessWidget {
  DataTableSectionScreen({super.key});

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
              'Section',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Actions',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(
                'L1C1',
              )),
              DataCell(Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: DeleteButton(color: Colors.red),
                  ),
                ],
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'L1C2',
              )),
              DataCell(Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: DeleteButton(color: Colors.red),
                  ),
                ],
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'L1C3',
              )),
              DataCell(Row(
                children: [
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

class DataTableRoutine2 extends StatelessWidget {
  DataTableRoutine2({super.key});

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
              'Day',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Time',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Subject',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Actions',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text("Sunday")),
              DataCell(Text("1:00 - 2:00")),
              DataCell(Text(
                'Network Operating System',
              )),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EditRoutine()));
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
            DataRow(cells: [
              DataCell(Text("Sunday")),
              DataCell(Text("1:00 - 2:00")),
              DataCell(Text(
                'Network Operating System',
              )),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EditRoutine()));
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
            DataRow(cells: [
              DataCell(Text("Sunday")),
              DataCell(Text("1:00 - 2:00")),
              DataCell(Text(
                'Network Operating System',
              )),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => EditRoutine()));
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

class DataTableStudentAttendance2 extends StatelessWidget {
  DataTableStudentAttendance2({super.key});

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
              'Name',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Email',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Subject',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Attendance',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text(
                'Rohan Rai',
              )),
              DataCell(Text(
                'rohan@gmail.com',
              )),
              DataCell(DropDownModule()),
              DataCell(Text(
                '96%',
              )),
            ]),
            DataRow(cells: [
              DataCell(Text(
                'Mohit Man Shrestha',
              )),
              DataCell(Text(
                'shresthamohit2@gmail.com',
              )),
              DataCell(DropDownModule()),
              DataCell(Text(
                '90%',
              )),
            ]),
          ],
        ),
      ],
    );
  }
}

class DataTableStudentAttendance extends StatelessWidget {
  DataTableStudentAttendance({super.key});

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
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Section',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Action',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            DataRow(cells: [
              DataCell(DropDownAcademicYear()),
              DataCell(DropDownAcademicSection()),
              DataCell(Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => ViewAttendance2()));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: MyButton(
                          text: 'View Attendance', color: Colors.lightGreen),
                    ),
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

class DataTableTeacherSearchResult extends StatelessWidget {
  DataTableTeacherSearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      DataTable(
        border: TableBorder.all(color: Colors.white),
        headingRowColor: MaterialStateProperty.resolveWith(
            (states) => Color.fromARGB(255, 16, 19, 101)),
        columns: [
          DataColumn(
              label: Text(
            'Teacher id',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            'Name',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            'Module',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            'Address',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            'Phone',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            'Email Address',
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            'Action',
            style: TextStyle(color: Colors.white),
          )),
        ],
        rows: [
          DataRow(
            cells: [],
          ),
        ],
      )
    ]);
  }
}

class DataTableStudentSearchResult extends StatelessWidget {
  DataTableStudentSearchResult({super.key});

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
              'Stud_id',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Name',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Year',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Faculty',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Phone',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Email address',
              style: TextStyle(color: Colors.white),
            )),
            DataColumn(
                label: Text(
              'Action',
              style: TextStyle(color: Colors.white),
            )),
          ],
          rows: [
            // DataRow(cells: [
            //   DataCell(Text('1')),
            //   DataCell(Text('Roshan Rai')),
            //   DataCell(Text('3rd Year')),
            //   DataCell(Text('Bsc(hons) Computing')),
            //   DataCell(Text('9829337338')),
            //   DataCell(Text('np05cp4s220045@iic.edu.np')),
            //   DataCell(Row(
            //     children: [
            //       InkWell(
            //         onTap: () {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (_) => ViewStudent()));
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.all(5.0),
            //           child: MyButton(text: 'View', color: Colors.lightGreen),
            //         ),
            //       ),
            //       InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (_) => EditStudentDetails()));
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.all(5.0),
            //           child: MyButton(text: 'Edit', color: Colors.orange),
            //         ),
            //       ),
            //       Padding(
            //         padding: EdgeInsets.all(5.0),
            //         child: DeleteButton(color: Colors.red),
            //       ),
            //     ],
            //   )),
            // ]),
          ],
        ),
      ],
    );
  }
}
