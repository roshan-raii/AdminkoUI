import 'package:admin/data/models/module_teacher.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/Screen/Dashboard/addTeacherAssign.dart';
import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/delete_button.dart';

class ViewSubject extends StatelessWidget {
  final int moduleId;
  const ViewSubject({super.key, required this.moduleId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteModuleTeacherCubit, DeleteModuleTeacherState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is DeleteModuleTeacherError){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if(state is DeleteModuleTeacherSuccess){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          var loginState = context.read<LoginBloc>().state;
          if(loginState is LoginSuccess){
          context.read<ViewModuleTeacherCubit>()..getModuleTeacher(token:loginState.successModel.token! , module: this.moduleId);
          }
        }
      },
      child: Scaffold(
        body: Column(
          children: [_buildSectionTitle(), _buildYearField(context)],
        ),
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
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              Text(
                "Year 1, Java",
                style: TextStyle(fontWeight: FontWeight.w400),
                textScaler: TextScaler.linear(3),
              ),
              InkWell(
                onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => AddTeacherAssign(moduleId: this.moduleId,)));
                },
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 45,
                    child: MyButton(
                      text: "Add Teacher",
                      color: Color.fromARGB(255, 192, 20, 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          BlocBuilder<ViewModuleTeacherCubit, ViewModuleTeacherState>(
            builder: (context, state) {
              if (state is ViewModuleTeacherLoading) {
                // context.read<ViewModule()
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is ViewModuleTeacherSuccess) {
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
                        for (ModuleTeacher moduleTeacher in state.moduleTeacher)
                          DataRow(cells: [
                            DataCell(Text(
                              moduleTeacher.module!.module_name!,
                            )),
                            DataCell(Text(moduleTeacher.teacher!.full_name!)),
                            DataCell(Row(
                              children: [
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
                                                        var loginState = context
                                                            .read<LoginBloc>()
                                                            .state;
                                                        if (loginState
                                                            is LoginSuccess) {
                                                          context.read<
                                                              DeleteModuleTeacherCubit>()
                                                            ..deleteModuleTeacher(
                                                                token: loginState
                                                                    .successModel
                                                                    .token!,
                                                                id: moduleTeacher
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
          )
          // DataTableTeacherAssign()
        ],
      ),
    );
  }
}
