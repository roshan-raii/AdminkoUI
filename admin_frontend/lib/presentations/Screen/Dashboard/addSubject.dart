import 'package:admin/logic/blocs/login/login_bloc.dart';
import 'package:admin/logic/cubits/add_module/cubit/add_module_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:admin/services/validation_service.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/textfield.dart';

import '../../../logic/cubits/fetch_module_year_faculty/fetch_module_year_faculty_cubit.dart';

class AddSubject extends StatefulWidget {
  final int faculty;
  final int year;
  const AddSubject({Key? key, required this.faculty, required this.year})
      : super(key: key);

  @override
  State<AddSubject> createState() => _AddModuleState();
}

class _AddModuleState extends State<AddSubject> {
  final TextEditingController _moduleNameController = TextEditingController();
  final TextEditingController _moduleDescriptionController =
      TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  DateTime? _moduleStartDate;
  DateTime? _moduleEndDate;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<AddModuleCubit, AddModuleState>(
        listener: (context, state) {
          if(state is AddModuleSuccess){
            int count = 0;
Navigator.of(context).popUntil((_) => count++ >= 2);
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
          if(state is AddModuleError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
          // TODO: implement listener
        },
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  _buildModuleSection(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: _submitForm,
                        child: Center(
                          child: SizedBox(
                            width: 150,
                            height: 45,
                            child: MyButton(
                              text: "Add ",
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
      ),
    );
  }

  Widget _buildModuleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextField(
          label: "Module Name",
          controller: _moduleNameController,
          validator: ValidationService.validateNonEmptiness,
        ),
        SizedBox(height: 9),
        MyTextField(
          label: "Description",
          controller: _moduleDescriptionController,
          validator: ValidationService.validateNonEmptiness,
          minLines: 3,
          maxLines: 5,
        ),
        SizedBox(height: 9),
        _buildDatePickerTextField("Start Date", _startDateController, (date) {
          setState(() {
            _moduleStartDate = date;
            _startDateController.text = DateFormat.yMd().format(date);
          });
        }),
        SizedBox(height: 9),
        _buildDatePickerTextField("End Date", _endDateController, (date) {
          setState(() {
            _moduleEndDate = date;
            _endDateController.text = DateFormat.yMd().format(date);
          });
        }),
      ],
    );
  }

  Widget _buildDatePickerTextField(String label,
      TextEditingController controller, Function(DateTime) onConfirm) {
    return InkWell(
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025),
        );
        if (picked != null) {
          onConfirm(picked);
        }
      },
      child: IgnorePointer(
        child: MyTextField(
          label: label,
          controller: controller,
          validator: ValidationService.validateNonEmptiness,
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _moduleStartDate != null &&
        _moduleEndDate != null) {
      // Navigator.pop(context);
      var loginState = context.read<LoginBloc>().state;
      if (loginState is LoginSuccess) {
        context.read<AddModuleCubit>()
          ..addModule(
              token: loginState.successModel.token!,
              subject: _moduleNameController.text,
              startDate: extractDate(_moduleStartDate.toString()),
              endDate: extractDate(_moduleEndDate.toString()),
              year: widget.year,
              faculty: widget.faculty,
              description: _moduleDescriptionController.text);

        // Navigator.pop(context);
        // context.read<FetchModuleYearFacultyCubit>()..fetchModuleYearFaculty(token: loginState.successModel.token!, faculty: this.fac, year: yearModel.name!);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Please fill in all fields and ensure all dates are selected.')),
      );
    }
  }

  String extractDate(String dateTimeStr) {
    return dateTimeStr.substring(0, 10);
  }
}
