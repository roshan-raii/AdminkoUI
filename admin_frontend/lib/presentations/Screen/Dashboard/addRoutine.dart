import 'package:admin/data/data_exports.dart';
import 'package:admin/logic/cubits/get_module_by_year/get_module_by_year_cubit.dart';
import 'package:admin/logic/logic_exports.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/dropDown.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addRoutine extends StatefulWidget {
  final int section;

  const addRoutine({super.key, required this.section});

  @override
  State<addRoutine> createState() => _addRoutineState();
}

class _addRoutineState extends State<addRoutine> {
  final _formKey = GlobalKey<FormState>();
  Module? module;
  String dropdownvalue = "Sunday";
  var items = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];
  TimeOfDay? _selectedTime;
  TimeOfDay? _endTime;
  String formatTimeOfDay24H(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  Future<void> _selectTime(BuildContext context, bool startTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime == false
          ? _endTime ?? TimeOfDay.now()
          : _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        // startTime == false{}
        if (startTime == false) {
          _endTime = picked;
        } else {
          _selectedTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocListener<AddRoutineCubit, AddRoutineState>(
        listener: (context, state) {
          if(state is AddRoutineSuccess){
            var loginState = context.read<LoginBloc>().state;
            if(loginState is LoginSuccess){
            context.read<FetchRoutineCubit>()..fetchRoutines(token: loginState.successModel.token!, section: widget.section);
            }
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pop(context);
          }
          if(state is AddRoutineError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<GetModuleByYearCubit, GetModuleByYearState>(
                  builder: (context, state) {
                    if (state is GetModuleByYearLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is GetModuleByYearError) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    if (state is GetModuleByYearSuccess) {
                      print(state.modules);
                      return Column(
                        children: [
                          _buildRoutineSection(state: state),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: Center(
                                  child: SizedBox(
                                    width: 150,
                                    height: 45,
                                    child: InkWell(
                                      onTap: () {
                                        var loginState =
                                            context.read<LoginBloc>().state;
                                        if (loginState is LoginSuccess) {
                                          context.read<AddRoutineCubit>()
                                            ..addRoutine(
                                                token: loginState
                                                    .successModel.token!,
                                                day: dropdownvalue,
                                                start_time: formatTimeOfDay24H(
                                                    _selectedTime!),
                                                end_time: formatTimeOfDay24H(
                                                    _endTime!),
                                                module: module!.id!,
                                                section: widget.section);
                                        }
                                      },
                                      child: MyButton(
                                        text: "Add",
                                        color: Color.fromARGB(255, 192, 20, 20),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
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

  Widget _buildRoutineSection({required GetModuleByYearSuccess state}) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Routine details:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            color: Color.fromARGB(255, 255, 255, 255))),
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Select Time',
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  readOnly: true, // Makes the text field read-only
                  controller: TextEditingController(
                      text: _selectedTime?.format(context)),
                  onTap: () => _selectTime(context, true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a time';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Select Time',
                    suffixIcon: Icon(Icons.access_time),
                  ),
                  readOnly: true, // Makes the text field read-only
                  controller:
                      TextEditingController(text: _endTime?.format(context)),
                  onTap: () => _selectTime(context, false),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a time';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Module>(
                  hint: Text("Please select one module"),
                  items: state.modules
                      .map((e) => DropdownMenuItem<Module>(
                            child: Text("${e.module_name}"),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    this.module = value;
                  },
                  validator: (value) =>
                      value == null ? 'Please select a module' : null,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
