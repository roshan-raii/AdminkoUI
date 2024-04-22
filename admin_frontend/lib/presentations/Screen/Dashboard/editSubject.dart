import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:admin/presentations/widgets/dateField.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';

class EditSubject extends StatefulWidget {
  const EditSubject({Key? key}) : super(key: key);

  @override
  State<EditSubject> createState() => _EditSubjectState();
}

class _EditSubjectState extends State<EditSubject> {
  final TextEditingController _subjectName = TextEditingController();
  final TextEditingController _subjectDescription = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
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
              _buildSubjectSection(),
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
                  "Subject details:",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                MyTextField(
                  label: "Subject Name",
                  controller: _subjectName,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 9),
                DateFormField(dateController: _startDate, label: "Start date"),
                SizedBox(height: 9),
                DateFormField(dateController: _endDate, label: "End date"),
                SizedBox(
                  height: 9,
                ),
                MyTextField(
                  label: "Description",
                  controller: _subjectDescription,
                  validator: ValidationService.validateNonEmptiness,
                  minLines: 3,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
