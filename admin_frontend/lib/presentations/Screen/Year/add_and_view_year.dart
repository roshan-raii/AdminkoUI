import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/Screen/Faculty/facultyDetails.dart';
import 'package:admin/presentations/Screen/Year/yearDetails.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddYear extends StatefulWidget {
  const AddYear({Key? key}) : super(key: key);

  @override
  State<AddYear> createState() => _AddYearState();
}

class _AddYearState extends State<AddYear> {
  final TextEditingController _yearName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<AddYearCubit, AddYearState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AddYearError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is AddYearSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            callYearsAPi(context);
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
                        var loginState = context.read<LoginBloc>().state;

                        if (_formKey.currentState!.validate()) {
                          if (loginState is LoginSuccess) {
                            context.read<AddYearCubit>()
                              ..addYear(
                                  token: loginState.successModel.token!,
                                  name: _yearName.text);
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
                BlocBuilder<FetchYearsCubit, FetchYearsState>(
                  builder: (context, state) {
                    if (state is FetchYearsInitial) {
                      callYearsAPi(context);
                    }
                    if (state is FetchYearsLoading) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          CircularProgressIndicator()
                        ],
                      );
                    }
                    if (state is FetchYearsError) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          MaterialButton(
                            onPressed: () {
                              callYearsAPi(context);
                            },
                            child: Text("Retry"),
                          )
                        ],
                      );
                    }
                    if (state is FetchYearsSuccess) {
                      return Column(
                        children: [
                          ViewYear(
                            years: state.years,
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
      ),
    );
  }

  void callYearsAPi(BuildContext context) {
    var loginState = context.read<LoginBloc>().state;
    if (loginState is LoginSuccess) {
      context.read<FetchYearsCubit>()
        ..fetchYears(token: loginState.successModel.token!);
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
                  "Add Year:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                MyTextField(
                  label: "Name",
                  controller: _yearName,
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
