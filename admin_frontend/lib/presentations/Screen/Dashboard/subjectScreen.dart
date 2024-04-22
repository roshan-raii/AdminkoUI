import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/editSubject.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/Screen/Dashboard/addSubject.dart';
import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_exports.dart';
import '../../../logic/cubits/fetch_module_year_faculty/fetch_module_year_faculty_cubit.dart';
import '../../widgets/delete_button.dart';
import 'view_subject.dart';

class SubjectScreen extends StatelessWidget {
  final int faculty;
  final int year;
  const SubjectScreen({super.key, required this.faculty, required this.year});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteModuleCubit, DeleteModuleState>(
      listener: (context, state) {
        if(state is DeleteModuleSuccess){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          int count = 0;
                                                          Navigator.of(context)
                                                              .popUntil((_) =>
                                                                  count++ >= 2);
        }
        if(state is DeleteModuleError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [_buildSectionTitle(
            faculty: faculty,
            year: year
          ), _buildYearField(context)],
        ),
      ),
    );
  }

  Widget _buildSectionTitle({required int faculty, required int year}) {
    
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

  Widget _buildYearField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 120.0, right: 120, top: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AddSubject(
                        faculty: faculty,
                        year: year,
                      )));
                },
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 45,
                    child: MyButton(
                      text: "Add Module ",
                      color: Color.fromARGB(255, 192, 20, 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<FetchModuleYearFacultyCubit,
                  FetchModuleYearFacultyState>(
                builder: (context, state) {
                  if (state is FetchModuleYearFacultyLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FetchModuleYearFacultySuccess) {
                    return Column(
                      children: [
                        // Text("data")
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
                            for (ModuleFacultyYearModel moduleFacultyYearModel
                                in state.moduleYearModels)
                              DataRow(cells: [
                                DataCell(Text(
                                  moduleFacultyYearModel.module!.module_name!,
                                )),
                                DataCell(Text(
                                    moduleFacultyYearModel.module_start_date!)),
                                DataCell(
                                    Text(moduleFacultyYearModel.module_end_date!)),
                                DataCell(Text(
                                    moduleFacultyYearModel.module!.description!)),
                                DataCell(Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        var loginState = context.read<LoginBloc>().state;
                                        if(loginState is LoginSuccess){
                                        context.read<GetAllTeachersCubit>()..getAllTeachers(token: loginState.successModel.token!);
                                        context.read<ViewModuleTeacherCubit>()..getModuleTeacher(token: loginState.successModel.token!, module: moduleFacultyYearModel.module!.id!);
                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => ViewSubject(
                                                  moduleId: moduleFacultyYearModel.module!.id!,
                                                )));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: MyButton(
                                            text: 'View',
                                            color:
                                                Color.fromARGB(255, 44, 209, 60)),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: ElevatedButton(
                                          child: Text(
                                            "Delete",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: ((context) => AlertDialog(
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.of(context)
                                                                .pop();
                                                          },
                                                          child: Text("Close"),
                                                        ),
                                                        TextButton(
                                                          onPressed: () {
                                                            var loginStaate =
                                                                context
                                                                    .read<
                                                                        LoginBloc>()
                                                                    .state;
                                                            if (loginStaate
                                                                is LoginSuccess) {
                                                              context.read<
                                                                  DeleteModuleCubit>()
                                                                ..deleteModule(
                                                                    token: loginStaate
                                                                        .successModel
                                                                        .token!,
                                                                    id: moduleFacultyYearModel
                                                                        .module!
                                                                        .id!);
                                                              
                                                            }
                                                          },
                                                          child: Text("Delete"),
                                                        )
                                                      ],
                                                      title: Text("Delete User?"),
                                                      contentPadding:
                                                          const EdgeInsets.all(20),
                                                      content: const Text(
                                                          "Are you sure about deleting?"),
                                                    )));
                                          },
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10))),
                                        )),
                                  ],
                                )),
                              ]),
                          ],
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
