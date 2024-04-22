import 'package:admin/data/data_exports.dart';
import 'package:admin/logic/cubits/add_student/add_student_cubit.dart';
import 'package:admin/logic/cubits/drop_down/drop_down_state.dart';
import 'package:admin/logic/cubits/store_images/cubit/store_images_cubit.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/dateField.dart';
import 'package:admin/presentations/widgets/image_picker.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController _dateOfBirth = TextEditingController();
  TextEditingController _dateOfJoin = TextEditingController();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _mobileNumber = TextEditingController();
  TextEditingController _emailAddress = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _collegeMail = TextEditingController();
  // TextEditingController _section = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        body: BlocListener<AddStudentCubit, AddStudentState>(
          listener: (context, state) {
            if (state is AddStudentLoading) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  "We are adding the student.. Please wait",
                ),
                duration: Duration(seconds: 1),
              ));
            }
            if (state is AddStudentSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Successfully Added Student")));
              Navigator.pop(context);
            }
            if (state is AddStudentError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<FetchSectionsCubit, FetchSectionsState>(
            builder: (context, state) {
              if (state is FetchSectionsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is FetchSectionsError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.message),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(onPressed: () {
                      // fetchAllSections(context);
                      fetchAllSections(context);
                      // fetchAll
                    })
                  ],
                ));
              }
              if (state is FetchSectionsSuccess) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
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
                                  context.read<AddStudentCubit>()
                                    ..addStudent(
                                        dob: _dateOfBirth.text,
                                        gender: context
                                            .read<DropDownValueCubit>()
                                            .state
                                            .value!,
                                        contactNumber: _mobileNumber.text,
                                        address: _address.text,
                                        joinDate: _dateOfJoin.text,
                                        image: context
                                            .read<StoreImagesCubit>()
                                            .state
                                            .images[0],
                                        full_name: _fullName.text,
                                        section: context
                                            .read<StoreValueCubit>()
                                            .state
                                            .message!,
                                        token: loginState.successModel.token!,
                                        collegeMail: _collegeMail.text,
                                        email: _emailAddress.text);
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
                );
              }
              fetchAllSections(context);
              return SizedBox();
            },
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

  void fetchAllSections(BuildContext context) {
    var loginState = context.read<LoginBloc>().state;
    if (loginState is LoginSuccess) {
      context.read<FetchSectionsCubit>()
        ..fetchSections(token: loginState.successModel.token!);
    }
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
                  validator: ValidationService.validateNonEmptiness,
                  controller: _fullName,
                ),
                SizedBox(height: 9),
                DateFormField(
                  dateController: _dateOfBirth,
                  label: 'Date of birth',
                ),
                SizedBox(height: 9),
                // DropDownGender(),
                BlocBuilder<DropDownValueCubit, DropDownValueState>(
                  builder: (context, state) {
                    return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 113, 112, 112))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: DropdownButton(
                            // Initial Value
                            value: state.value,

                            isExpanded: true,
                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: state.items!.map((dynamic items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (dynamic newValue) {
                              context
                                  .read<DropDownValueCubit>()
                                  .changeDropDownValue(newValue);
                              // setState(() {
                              //   dropdownvalue = newValue!;
                              // });
                            },
                          ),
                        ));
                  },
                ),
                SizedBox(height: 9),
                MyTextField(
                  label: "Contact Number",
                  keyboardType: TextInputType.number,
                  validator: ValidationService.validateMobileNumber,
                  controller: _mobileNumber,
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
                  "Academic details:",
                  style: TextStyle(fontSize: 20),
                ),
                // SizedBox(height: 20),
                // //  MyTextField(label: "Teacher qualification"),
                // //  SizedBox(height: 11),
                // //  MyTextField(label: "Teacher experience"),
                // //  SizedBox(height: 11),
                // DropDownFaculty(),
                SizedBox(height: 10),
                MyTextField(
                  label: "College email",
                  keyboardType: TextInputType.text,
                  validator: ValidationService.validateEmail,
                  controller: _collegeMail,
                ),
                SizedBox(
                  height: 10,
                ),
                DateFormField(
                  dateController: _dateOfJoin,
                  label: 'Joining date',
                ),
                SizedBox(height: 9), // For alignment with the other column
                SizedBox(height: 9),
                // DropDownAcademicYear(),
                BlocBuilder<FetchSectionsCubit, FetchSectionsState>(
                  builder: (context, state) {
                    if (state is FetchSectionsSuccess) {
                      return SectionDropdown(
                        sections: state.sections,
                        // selectedSectionId: ,
                        onChanged: (value) {
                          context.read<StoreValueCubit>()
                            ..storeValue(value: value.toString());
                        },
                        // selectedSectionId: ,
                      );
                      // return Container()
                      // return Container(
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(4),
                      //         border: Border.all(
                      //             color: const Color.fromARGB(
                      //                 255, 113, 112, 112))),
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 12.0),
                      //       child: DropdownButton(
                      //         // Initial Value
                      //         value: dropdownvalue,

                      //         isExpanded: true,
                      //         // Down Arrow Icon
                      //         icon: const Icon(Icons.keyboard_arrow_down),

                      //         // Array list of items
                      //         items: state.i.map((String items) {
                      //           return DropdownMenuItem(
                      //             value: items,
                      //             child: Text(items),
                      //           );
                      //         }).toList(),
                      //         // After selecting the desired option,it will
                      //         // change button value to selected value
                      //         onChanged: (String? newValue) {
                      //           setState(() {
                      //             dropdownvalue = newValue!;
                      //           });
                      //         },
                      //       ),
                      //     ));
                    }
                    return Container();
                  },
                ),
                SizedBox(height: 13),
                MyTextField(
                  label: "Description (if any)",
                ),
                SizedBox(height: 10),
                BlocBuilder<StoreImagesCubit, StoreImagesState>(
                  builder: (context, state) {
                    if (state.images.length != 0) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.file(state.images[0]),
                        //  FileImage(state.images[0].path),
                        height: 100,
                        width: 100,
                      );
                    }
                    return Container();
                  },
                ), // For alignment with the other column
                MyImagePicker()
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SectionDropdown extends StatelessWidget {
  final List<SectionModel> sections;
  final int? selectedSectionId;
  final ValueChanged<int?> onChanged;

  const SectionDropdown({
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
      items: sections.map<DropdownMenuItem<int>>((SectionModel section) {
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
}
