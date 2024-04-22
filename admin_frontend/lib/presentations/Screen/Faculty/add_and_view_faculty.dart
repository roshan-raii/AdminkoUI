import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Faculty/facultyDetails.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFaculty extends StatefulWidget {
  const AddFaculty({Key? key}) : super(key: key);

  @override
  State<AddFaculty> createState() => _AddFacultyState();
}

class _AddFacultyState extends State<AddFaculty> {
  final TextEditingController _facultyName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<AddFacultyCubit, AddFacultyState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AddFacultyError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is AddFacultySuccess) {
            fetchAllFaculties(context);
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(),
                SizedBox(
                  height: 10,
                ),
                _buildSubjectSection(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigator.pop(context);
                          // context.read<L()
                          var loginState = context.read<LoginBloc>().state;
                          if (loginState is LoginSuccess) {
                            context.read<AddFacultyCubit>().addFaculty(
                                name: _facultyName.text,
                                token: loginState.successModel.token!);
                          }
                        }
                      },
                      child: Center(
                        child: SizedBox(
                          width: 150,
                          height: 45,
                          child: MyButton(
                            text: "Add",
                            color: Color.fromARGB(255, 20, 34, 192),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Faculty details:"),
                ),
                BlocBuilder<FetchFacultyCubit, FetchFacultyState>(
                  builder: (context, state) {
                    if (state is FetchFacultyInitial) {
                      fetchAllFaculties(context);
                    }
                    if (state is FetchFacultyLoading) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          CircularProgressIndicator()
                        ],
                      );
                    }
                    if (state is FetchFacultyError) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          MaterialButton(
                              child: Text("Retry"),
                              onPressed: () {
                                fetchAllFaculties(context);
                              })
                        ],
                      );
                    }
                    if (state is FetchFacultySuccess) {
                      return ViewFaculty(
                        faculties: state.faculties,
                      );
                    }
                    return SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchAllFaculties(BuildContext context) {
    var loginState = context.read<LoginBloc>().state;
    if (loginState is LoginSuccess) {
      context.read<FetchFacultyCubit>()
        ..fetchFaulties(token: loginState.successModel.token!);
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

  Widget _buildSubjectSection() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add Faculty:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                MyTextField(
                  label: "Name",
                  controller: _facultyName,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 9),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
