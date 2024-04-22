import 'package:admin/data/data_exports.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/datatable.dart';
import 'package:admin/presentations/Screen/Dashboard/routine2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/button.dart';
import '../../widgets/dropDown.dart';

class Routinescreen extends StatelessWidget {
  const Routinescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _buildSectionTitle(),
        BlocBuilder<FetchYearSectionsCubit, FetchYearSectionsState>(
          builder: (context, state) {
            if (state is FetchYearSectionsLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            }
            if (state is FetchYearSectionsError) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.message),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        var loginState = context.read<LoginBloc>().state;
                        if (loginState is LoginSuccess) {
                          context.read<FetchYearSectionsCubit>()
                            ..fetchYearSections(
                                token: loginState.successModel.token!);
                        }
                      },
                      child: Text("Error"),
                    )
                  ],
                ),
              );
            }
            if (state is FetchYearSectionsSuccess) {
              context.read<RoutineDropdownLogicCubit>()
                ..initializeDropDown(sectionsMap: state.yearSections);
              // print(state.yearSections);
              var fetchYear = context.read<RoutineDropdownLogicCubit>().state;
              String years = fetchYear.year!;

              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: fetchYear.year,
                      onChanged: (value) {
                        context
                            .read<RoutineDropdownLogicCubit>()
                            .changeDropDownValue(value!);
                      },
                      items: fetchYear.years!
                          .map<DropdownMenuItem<String>>((String year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        hintText: 'Select Year',
                      ),
                    ),
                    SizedBox(height: 20,),
                    BlocBuilder<RoutineDropdownLogicCubit, RoutineDropdownLogicState>(
                      builder: (context, state) {
                        return DataTable(
                          border: TableBorder.all(color: Colors.white),
                          headingRowColor: MaterialStateProperty.resolveWith(
                              (states) => Color.fromARGB(255, 16, 19, 101)),
                          columns: [
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
                            for(SectionModel sectionModel in state.sections!)
                            DataRow(cells: [
                              DataCell(Text(sectionModel.name!)),
                              DataCell(Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                                            var loginState = context.read<LoginBloc>().state;
                      if(loginState is LoginSuccess){
                      context.read<FetchRoutineCubit>()..fetchRoutines(token: loginState.successModel.token!, section: sectionModel.id!);

                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => ViewRoutine2(section: sectionModel.id!,yearId: context.read<RoutineDropdownLogicCubit>().state.year!,)));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: MyButton(
                                          text: 'View',
                                          color: Colors.lightGreen),
                                    ),
                                  ),
                                ],
                              )),
                            ]),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              );

              //  _buildRoutine();
            } else {
              a(context);
              return SizedBox();
            }
          },
        )
      ],
    ));
  }

  void a(BuildContext context) {
    var loginState = context.read<LoginBloc>().state;
    if (loginState is LoginSuccess) {
      context.read<FetchYearSectionsCubit>()
        ..fetchYearSections(token: loginState.successModel.token!);
    }
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

  Widget _buildRoutine() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataTableRoutineOne(),
      ],
    );
  }
}
