// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin/presentations/Screen/Dashboard/addSection.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/data_exports.dart';
import '../../../logic/logic_exports.dart';

class SectionScreen extends StatelessWidget {
  final int faculty;
  final int year;
  const SectionScreen({
    Key? key,
    required this.faculty,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteFacultyYearSectionCubit, DeleteFacultyYearSectionState>(
      listener: (context, state) {
        if(state is DeleteFacultyYearSectionSuccess){
            var loginState = context.read<LoginBloc>().state;
              if (loginState is LoginSuccess) {
                context.read<FetchFacultyYearSectionCubit>()
                  ..fetchSections(
                      token: loginState.successModel.token!,
                      faculty: faculty,
                      year: year);
              }
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if(state is DeleteFacultyYearSectionError){
             if (state is AddFacultyYearSectionError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
        ),
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
              Text("1st Year"),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddSection(
                                faculty: faculty,
                                year: year,
                              )));
                },
                child: Center(
                  child: SizedBox(
                    width: 150,
                    height: 45,
                    child: MyButton(
                      text: "Add Section",
                      color: Color.fromARGB(255, 192, 20, 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // DataTableSectionScreen()
          BlocBuilder<FetchFacultyYearSectionCubit,
              FetchFacultyYearSectionState>(
            builder: (context, state) {
              if (state is FetchFacultyYearSectionLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FetchFacultyYearSectionError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is FetchFacultyYearSectionSuccess) {
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
                        for (YearSectionFacultyModel yearSectionFacultyModel
                            in state.sections)
                          DataRow(cells: [
                            DataCell(Text(
                              yearSectionFacultyModel.section!.name!,
                            )),
                            DataCell(Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: MaterialButton(
                                    onPressed: () {
                                      var loginState = context.read<LoginBloc>().state;
                                      if(loginState is LoginSuccess){

                                      context.read<DeleteFacultyYearSectionCubit>()..deleteSection(token:loginState.successModel.token! ,sectionId: yearSectionFacultyModel.section!.id!);
                                      }
                                    },
                                    child: Text("Delete"),
                                  ),
                                )
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
        ],
      ),
    );
  }
}
