import 'package:admin/logic/blocs/login/login_bloc.dart';
import 'package:admin/logic/cubits/add_module_teacher/add_module_teacher_cubit.dart';
import 'package:admin/logic/cubits/view_module_teacher/view_module_teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/data/models/teacher_model.dart'; // Make sure to import your TeacherModel
import 'package:admin/logic/cubits/get_all_teachers/get_all_teachers_cubit.dart';
import 'package:admin/presentations/widgets/button.dart'; // Assuming this is your custom button widget
import 'package:admin/Services/validation_service.dart'; // Assuming this contains your form validation logic
import 'package:admin/presentations/widgets/textfield.dart'; // Assuming this is your custom TextField widget

class AddTeacherAssign extends StatefulWidget {
  final int moduleId;

  const AddTeacherAssign({Key? key, required this.moduleId}) : super(key: key);

  @override
  State<AddTeacherAssign> createState() => _AddTeacherAssignState();
}

class _AddTeacherAssignState extends State<AddTeacherAssign> {
  final TextEditingController _subjectName = TextEditingController();
  final TextEditingController _subjectDescription = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  TeacherModel? _selectedTeacher; // To keep track of the selected teacher

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<AddModuleTeacherCubit, AddModuleTeacherState>(
        listener: (context, state) {
          if(state is AddModuleTeacherSuccess){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            var loginState  = context.read<LoginBloc>().state;
            if(loginState is LoginSuccess){
            context.read<ViewModuleTeacherCubit>()..getModuleTeacher(token: loginState.successModel.token!, module: widget.moduleId);
            Navigator.pop(context);
            }
          }
          if(state is AddModuleTeacherError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                _buildSectionTitle(),
                const SizedBox(height: 10),
                BlocBuilder<GetAllTeachersCubit, GetAllTeachersState>(
                  builder: (context, state) {
                    if (state is GetAllTeachersLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetAllTeachersSuccess) {
                      List<DropdownMenuItem<TeacherModel>> dropdownItems = state
                          .teachers
                          .map<DropdownMenuItem<TeacherModel>>((teacher) {
                        return DropdownMenuItem<TeacherModel>(
                          value: teacher,
                          child: Text(teacher.full_name ?? 'No Name'),
                        );
                      }).toList();

                      return Column(
                        children: [
                          DropdownButton<TeacherModel>(
                            isExpanded: true,
                            value: _selectedTeacher,
                            items: dropdownItems,
                            onChanged: (value) {
                              setState(() {
                                _selectedTeacher = value;
                              });
                            },
                            hint: const Text("Select a Teacher"),
                          ),
                          MaterialButton(onPressed: (){
                             if (_selectedTeacher != null) {
                                print(
                                    'Selected Teacher ID: ${_selectedTeacher!.id}');
                                var loginState =
                                    context.read<LoginBloc>().state;
                                if (loginState is LoginSuccess) {
                                  context.read<AddModuleTeacherCubit>()
                                    ..addModuleTeacher(
                                        token: loginState.successModel.token!,
                                        module: widget.moduleId,
                                        teacher: _selectedTeacher!.id!);
                                }}
                          },
                          child: Text("Add Teacher"),
                          ),
                          // MyButton(
                          //   text: "Add Teaccher",
                          //   onTap: () {
                          //     if (_selectedTeacher != null) {
                          //       print(
                          //           'Selected Teacher ID: ${_selectedTeacher!.id}');
                          //       var loginState =
                          //           context.read<LoginBloc>().state;
                          //       if (loginState is LoginSuccess) {
                          //         context.read<AddModuleTeacherCubit>()
                          //           ..addModuleTeacher(
                          //               token: loginState.successModel.token!,
                          //               module: widget.moduleId,
                          //               teacher: _selectedTeacher!.id!);
                          //       }
                          //     }
                          //   },
                          // )
                          //  context.read()
                        ],
                      );
                    } else if (state is GetAllTeachersError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    return const SizedBox();
                  },
                )
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
}
