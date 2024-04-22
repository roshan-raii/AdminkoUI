import 'package:admin/data/data_exports.dart';
import 'package:admin/logic/cubits/add_teacher/add_teacher_cubit.dart';
import 'package:admin/logic/cubits/store_images/cubit/store_images_cubit.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/dateField.dart';
import 'package:admin/presentations/widgets/image_picker.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTeacher extends StatefulWidget {
  const AddTeacher({Key? key}) : super(key: key);

  @override
  State<AddTeacher> createState() => _AddTeacherState();
}

class _AddTeacherState extends State<AddTeacher> {
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _dateOfJoin = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _teacherQualification = TextEditingController();
  final TextEditingController _teacherExperience = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = "Male";
  var items = ["Male", "Female", "Other"];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocListener<AddTeacherCubit, AddTeacherState>(
          listener: (context, state) {
            if (state is AddTeacherLoading) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Please wait...... while we add the student"),
                duration: Duration(seconds: 1),
              ));
            }
            if (state is AddTeacherError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
            if (state is AddTeacherSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              Navigator.pop(context);
            }
          },
          child: BlocBuilder<FetchFacultyCubit, FetchFacultyState>(
            builder: (context, state) {
              if (state is FetchFacultyError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        fetchFaculties(context);
                      },
                      child: Text("Retry"),
                    )
                  ],
                );
              }
              if (state is FetchFacultyLoading) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                );
              }
              if (state is FetchFacultySuccess) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle(),
                        SizedBox(
                          height: 5,
                        ),
                        _buildPersonalDetailsSection(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  var loginState =
                                      context.read<LoginBloc>().state;
                                  if (loginState is LoginSuccess) {
                                    context.read<AddTeacherCubit>()
                                      ..addTeacher(
                                          faculty: context
                                              .read<StoreValueCubit>()
                                              .state
                                              .message!,
                                          dob: _dateOfBirth.text,
                                          gender: dropdownvalue,
                                          contactNumber: _contactNumber.text,
                                          address: _address.text,
                                          joinDate: _dateOfJoin.text,
                                          collegeMail: _emailAddress.text,
                                          email: _emailAddress.text,
                                          full_name: _fullName.text,
                                          user_type: "Teacher",
                                          experience: _teacherExperience.text,
                                          qualification:
                                              _teacherQualification.text,
                                          image: context
                                              .read<StoreImagesCubit>()
                                              .state
                                              .images[0],
                                          token:
                                              loginState.successModel.token!);
                                  }
                                }
                              },
                              child: Center(
                                child: SizedBox(
                                  width: 150,
                                  height: 45,
                                  child: MyButton(
                                    text: "Update",
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
                );
              }
              return Column();
            },
          ),
        ),
      ),
    );
  }

  void fetchFaculties(BuildContext context) {
    var loginBloc = context.read<LoginBloc>().state;
    if (loginBloc is LoginSuccess) {
      context.read<FetchFacultyCubit>()
        ..fetchFaulties(token: loginBloc.successModel.token!);
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

  Widget _buildPersonalDetailsSection() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal details:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                MyTextField(
                  label: "Full Name",
                  controller: _fullName,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 9),
                DateFormField(
                  dateController: _dateOfBirth,
                  label: 'Date of birth',
                ),
                SizedBox(height: 9),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: const Color.fromARGB(255, 113, 112, 112))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: DropdownButton(
                        value: dropdownvalue,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                      ),
                    )),
                SizedBox(height: 9),
                MyTextField(
                  label: "Contact Number",
                  controller: _contactNumber,
                  validator: ValidationService.validateMobileNumber,
                ),
                SizedBox(height: 9), // For alignment with the other column
                MyTextField(
                  label: "Email Address",
                  controller: _emailAddress,
                  validator: ValidationService.validateEmail,
                ),
                SizedBox(height: 9),
                MyTextField(
                  label: "Address",
                  controller: _address,
                  validator: ValidationService.validateNonEmptiness,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Professional details:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                MyTextField(
                  label: "Teacher qualification",
                  controller: _teacherQualification,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 11),
                MyTextField(
                  label: "Teacher experience",
                  controller: _teacherExperience,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 11),
                DateFormField(
                  dateController: _dateOfJoin,
                  label: 'Joining date',
                ),
                SizedBox(height: 13),
                BlocBuilder<FetchFacultyCubit, FetchFacultyState>(
                  builder: (context, state) {
                    if (state is FetchFacultySuccess) {
                      return FacultyDropDown(
                        sections: state.faculties,
                        onChanged: (value) {
                          context.read<StoreValueCubit>()
                            ..storeValue(value: value.toString());
                        },
                      );
                    }
                    return SizedBox();
                  },
                ),
                SizedBox(height: 13),
                MyTextField(label: "Description (if any)"),
                SizedBox(height: 10),
                BlocBuilder<StoreImagesCubit, StoreImagesState>(
                  builder: (context, state) {
                    if (state.images.length != 0) {
                      // return Container(
                      //   width: 100,
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //       color: Colors.amber,
                      //       image: DecorationImage(
                      //           image: FileImage(state.images[0]),
                      //           fit: BoxFit.cover)),
                      // );
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.file(
                          state.images[0],
                          height: 100,
                          width: 100,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                MyImagePicker() // For alignment with the other column
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FacultyDropDown extends StatelessWidget {
  final List<FacultyModel> sections;
  final int? selectedSectionId;
  final ValueChanged<int?> onChanged;

  const FacultyDropDown({
    Key? key,
    required this.sections,
    required this.onChanged,
    this.selectedSectionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int>(
      value: selectedSectionId,
      onChanged: onChanged,
      items: sections.map<DropdownMenuItem<int>>((FacultyModel section) {
        return DropdownMenuItem<int>(
          value: section.id,
          child: Text(section.name ?? ''),
        );
      }).toList(),
      decoration: InputDecoration(
        hintText: 'Select Faculty',
      ),
    );
  }
}
