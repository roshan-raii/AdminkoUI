import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/dropDown.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';

class EditRoutine extends StatefulWidget {
  const EditRoutine({Key? key}) : super(key: key);

  @override
  State<EditRoutine> createState() => _EditRoutineState();
}

class _EditRoutineState extends State<EditRoutine> {
  final TextEditingController _routineTime = TextEditingController();
  final TextEditingController _routineSubject = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              _buildRoutineSection(),
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

  Widget _buildRoutineSection() {
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
                DropDownDay(),
                SizedBox(height: 10),
                MyTextField(
                  label: "Time",
                  controller: _routineTime,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 9),
                MyTextField(
                  label: "Subject",
                  controller: _routineSubject,
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
