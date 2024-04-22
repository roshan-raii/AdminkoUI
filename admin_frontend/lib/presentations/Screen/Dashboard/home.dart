// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin/logic/blocs/login/login_bloc.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_exports.dart';
import '../../widgets/button.dart';
import '../../widgets/delete_button.dart';
import 'edit_student_details.dart';
import 'edit_teacher_detail.dart';
import 'view_student_detail_on_dashboard.dart';
import 'view_teacher_detail_on_dashboard.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/banner.png",
                    scale: 2,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Log Out")),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginSuccess) {
                        return Text(state.successModel.token!);
                      }
                      return Text("data");
                    },
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.people_alt_sharp,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Total No. of students",
                              textScaler: TextScaler.linear(1.7),
                            ),
                            BlocBuilder<ViewUsersCubit, ViewUsersState>(
                              builder: (context, state) {
                                if (state is ViewUsersSuccess) {
                                  return Text(
                                    state.student.length.toString(),
                                    textScaler: TextScaler.linear(1.7),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  );
                                }
                                return SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.people_alt_sharp,
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Total No. of Teachers",
                                textScaler: TextScaler.linear(1.7),
                              ),
                              BlocBuilder<ViewUsersCubit, ViewUsersState>(
                                builder: (context, state) {
                                  if (state is ViewUsersSuccess) {
                                    return Text(
                                      state.teachers.length.toString(),
                                      textScaler: TextScaler.linear(1.7),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    );
                                  }
                                  return SizedBox();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<ViewUsersCubit, ViewUsersState>(
                builder: (context, state) {
                  if (state is ViewUsersInitial) {
                    // context.read()
                    callHomeApis(context);
                  }
                  if (state is ViewUsersLoading) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        CircularProgressIndicator()
                      ],
                    );
                  }
                  if (state is ViewUsersError) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        MaterialButton(
                          onPressed: () {
                            callHomeApis(context);
                          },
                          child: Text("Retry"),
                        ),
                      ],
                    );
                  }
                  if (state is ViewUsersSuccess) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "STUDENTS DETAILS",
                              style: TextStyle(),
                              textScaler: TextScaler.linear(2),
                            ),
                          ],
                        ),
                        DataTableStudentHome(
                          student: state.student,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "TEACHERS DETAILS",
                              style: TextStyle(),
                              textScaler: TextScaler.linear(2),
                            ),
                          ],
                        ),
                        DataTableTeacherHomeView(
                          teachers: state.teachers,
                        )
                      ],
                    );
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void callHomeApis(BuildContext context) {
    var loginState = context.read<LoginBloc>().state;
    if (loginState is LoginSuccess) {
      context.read<ViewUsersCubit>()
        ..viewUsers(token: loginState.successModel.token!);
    }
  }
}

class DataTableStudentHome extends StatelessWidget {
  final List<StudentModel> student;
  DataTableStudentHome({super.key, required this.student});

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
            for (StudentModel studentModel in this.student)
              DataRow(
                cells: [
                  DataCell(Text(studentModel.full_name.toString())),
                  DataCell(Text(studentModel.year!.name!)),
                  DataCell(Text(studentModel.faculty!.name!)),
                  DataCell(Text(studentModel.contactNumber!)),
                  DataCell(Text(studentModel.email!)),
                  DataCell(Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ViewStudent(
                                        student: studentModel,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child:
                              MyButton(text: 'View', color: Colors.lightGreen),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EditStudentDetails()));
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
                ],
              ),
          ],
        ),
      ],
    );
  }
}

class DataTableTeacherHomeView extends StatelessWidget {
  final List<TeacherModel> teachers;
  const DataTableTeacherHomeView({
    Key? key,
    required this.teachers,
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
              'Name',
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
            for (TeacherModel teacher in teachers)
              DataRow(
                cells: [
                  DataCell(Text(teacher.full_name!)),
                  DataCell(Text(teacher.address!)),
                  DataCell(Text(teacher.contactNumber!)),
                  DataCell(Text(teacher.collegeMail!)),
                  DataCell(Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ViewTeacher(
                                        teacherModel: teacher,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child:
                              MyButton(text: 'View', color: Colors.lightGreen),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EditTeacherDetails()));
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
                ],
              ),
          ],
        ),
      ],
    );
  }
}
