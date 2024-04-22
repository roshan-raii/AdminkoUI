import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/textfield.dart';

class EditFaculty extends StatefulWidget {
  const EditFaculty({Key? key}) : super(key: key);

  @override
  State<EditFaculty> createState() => _EditFacultyState();
}

class _EditFacultyState extends State<EditFaculty> {
  final TextEditingController _facultyName = TextEditingController();
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
