import 'package:admin/data/data_exports.dart';
import 'package:admin/logic/cubits/get_module_by_year/get_module_by_year_cubit.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/addRoutine.dart';
import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:admin/presentations/Screen/Dashboard/editRoutine.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/delete_button.dart';

class ViewRoutine2 extends StatelessWidget {
  final int section;
  final String yearId;
   ViewRoutine2({super.key, required this.section, required this.yearId});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteRoutineCubit, DeleteRoutineState>(
      listener: (context, state) {
        if(state is DeleteRoutineSuccess){
          var loginState = context.read<LoginBloc>().state;
          if(loginState is LoginSuccess){
          context.read<FetchRoutineCubit>()..fetchRoutines(token: loginState.successModel.token!, section: section);
  
          }
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if(state is DeleteRoutineError){
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
          children: [_buildSectionTitle(), _buildRoutineSection(context)],
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
        ),
      ],
    );
  }

  Widget _buildRoutineSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                var state = context.read<LoginBloc>().state;
                if(state is LoginSuccess){
                 context.read<GetModuleByYearCubit>()..getModule(token: state.successModel.token!, yearId: yearId);
                }
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => addRoutine(
                      section: this.section,
                    )));
              },
              child: Center(
                child: SizedBox(
                  width: 170,
                  height: 45,
                  child: MyButton(
                    text: "Add New Routine",
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
            BlocBuilder<FetchRoutineCubit, FetchRoutineState>(
              builder: (context, state) {
                // if(state is FetchRoutineInitial){}
                if (state is FetchRoutineLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is FetchRoutineSuccess) {
                  return DataTable(
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
                      for (RoutineModel routineModel in state.routines)
                        DataRow(cells: [
                          DataCell(Text(routineModel.day!)),
                          DataCell(Text(
                              "${routineModel.start_time} - ${routineModel.end_time}")),
                          DataCell(Text(
                            routineModel.module!.module_name!,
                          )),
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
                                                            DeleteRoutineCubit>()
                                                          .deleteRoutine(
                                                              token: loginState
                                                                  .successModel
                                                                  .token!,
                                                              id: routineModel
                                                                  .id!);
                                                                  Navigator.pop(context);
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
                  );
                }
                return SizedBox();
              },
            ),
          ],
        )
      ],
    );
  }
}
