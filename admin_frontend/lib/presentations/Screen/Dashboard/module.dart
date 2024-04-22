import 'package:admin/data/data_exports.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Dashboard/subjectScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubits/fetch_module_year_faculty/fetch_module_year_faculty_cubit.dart';
import '../../widgets/button.dart';
import 'sectionScreen.dart';

class ModuleScreen extends StatelessWidget {
  const ModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_buildSectionTitle(), _buildYearField(context)],
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
          BlocBuilder<FetchModuleFacultyCubit, FetchModuleFacultyState>(
            builder: (context, state) {
              if (state is FetchModuleFacultyLoading) {
                return CircularProgressIndicator();
              }
              if (state is FetchModuleFacultyInitial) {
                var loginState = context.read<LoginBloc>().state;
                if (loginState is LoginSuccess) {
                  context.read<FetchModuleFacultyCubit>()
                    ..fetchYearFaculty(token: loginState.successModel.token!);
                }
                return SizedBox();
              }
              if (state is FetchModuleFacultySuccess) {
                return DropdownButtonFormField<int>(
                  value: state.selectedFaculty!,
                  onChanged: (value) {
                    context.read<FetchModuleFacultyCubit>()
                      ..changeCurrentFaculty(facultyId: value!);
                  },
                  items: state.faculties
                      .map<DropdownMenuItem<int>>((FacultyModel section) {
                    return DropdownMenuItem<int>(
                      value: section.id,
                      child: Text(section.name ?? ''),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    hintText: 'Select Section',
                  ),
                );
              }
              return SizedBox();
            },
          ),
          // DataTabl0eYear()
SizedBox(height: 30,),
          BlocBuilder<FetchModuleFacultyCubit, FetchModuleFacultyState>(
            builder: (context, state) {
              if(state is FetchModuleFacultySuccess){
              return DataTable(
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
                    style: TextStyle(color: Colors.white),
                  )),
                ],
                rows: [
                  for(YearModel yearModel in state.years)
                  DataRow(cells: [
                    DataCell(Text(
                      yearModel.name!,
                    )),
                    DataCell(Row(
                      children: [
                        InkWell(
                          onTap: () {
                            var fetchState = context.read<FetchModuleFacultyCubit>().state;
                            var state = context.read<LoginBloc>().state;
                            late int facultyYear;
                            if(state is LoginSuccess){
                              if(fetchState is FetchModuleFacultySuccess){
                              context.read<FetchModuleYearFacultyCubit>()..fetchModuleYearFaculty(token: state.successModel.token!, faculty: fetchState.selectedFaculty.toString(), year: yearModel.name!);
                              facultyYear = fetchState.selectedFaculty!;
                              }
                            
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SubjectScreen(
                                      year: yearModel.id!,
                                      faculty: facultyYear,
                                    )));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Center(
                                child: MyButton(
                                    text: 'View Module',
                                    color: Colors.lightGreen)),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            var fetchState = context.read<FetchModuleFacultyCubit>().state;
                            var state = context.read<LoginBloc>().state;
                            late int facultyYear;
                            if(state is LoginSuccess){
                              if(fetchState is FetchModuleFacultySuccess){
                                context.read<FetchFacultyYearSectionCubit>()..fetchSections(token: state.successModel.token!, faculty: fetchState.selectedFaculty!, year: yearModel.id!);
                              facultyYear = fetchState.selectedFaculty!;
                              }
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SectionScreen(
                                      faculty: facultyYear,
                                      year: yearModel.id! ,
                                    )));
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
              );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
