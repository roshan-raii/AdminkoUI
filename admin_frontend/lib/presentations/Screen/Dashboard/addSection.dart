import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddSection extends StatefulWidget {
  final int faculty;
  final int year;

  const AddSection({super.key, required this.faculty, required this.year});
  // const AddSection({Key? key}) : super(key: key);

  @override
  State<AddSection> createState() => _AddSectionState();
}

class _AddSectionState extends State<AddSection> {
  final TextEditingController _sectionName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<AddFacultyYearSectionCubit,
          AddFacultyYearSectionState>(
        listener: (context, state) {
          if (state is AddFacultyYearSectionSuccess) {
            var loginState = context.read<LoginBloc>().state;
            if (loginState is LoginSuccess) {
              context.read<FetchFacultyYearSectionCubit>()
                ..fetchSections(
                    token: loginState.successModel.token!,
                    faculty: widget.faculty,
                    year: widget.year);
            }
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is AddFacultyYearSectionError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back)),
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
                          var loginState = context.read<LoginBloc>().state;
                          if (loginState is LoginSuccess) {
                            context.read<AddFacultyYearSectionCubit>()
                              ..addFacultyYearSection(
                                  token: loginState.successModel.token!,
                                  name: _sectionName.text,
                                  year: widget.year,
                                  faculty: widget.faculty);
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
              ],
            ),
          ),
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
                  "Section name:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                MyTextField(
                  label: "Section Name",
                  controller: _sectionName,
                  validator: ValidationService.validateNonEmptiness,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
