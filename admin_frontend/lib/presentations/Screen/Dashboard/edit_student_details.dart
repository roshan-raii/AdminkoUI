import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/dateField.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/dropDown.dart';
import 'package:admin/presentations/widgets/textfield.dart';

class EditStudentDetails extends StatefulWidget {
  const EditStudentDetails({Key? key}) : super(key: key);

  @override
  State<EditStudentDetails> createState() => _EditStudentDetailsState();
}

class _EditStudentDetailsState extends State<EditStudentDetails> {
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _dateOfJoin = TextEditingController();
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
              _buildSectionTitle('Student Profile', 'Edit Profile'),
              SizedBox(
                height: 40,
              ),
              _buildPersonalDetailsSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 45,
                      child: MyButton(
                        text: "Update",
                        color: Color.fromARGB(255, 20, 34, 192),
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

  Widget _buildSectionTitle(String title1, String title2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: Color.fromARGB(255, 11, 13, 116),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      title2,
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                MyTextField(label: "Full Name"),
                SizedBox(height: 9),
                DateFormField(
                  dateController: _dateOfBirth,
                  label: 'Date of birth',
                ),
                SizedBox(height: 9),
                DropDownGender(),
                SizedBox(height: 9),
                MyTextField(label: "Contact Number"),
                SizedBox(height: 9), // For alignment with the other column
                MyTextField(label: "Email Address"),
                SizedBox(height: 9),
                MyTextField(label: "Address"),
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
                SizedBox(height: 20),
                MyTextField(label: "Student id"),
                SizedBox(height: 11),
                DropDownAcademicYear(),
                SizedBox(height: 13),
                DropDownFaculty(),
                SizedBox(height: 9),
                DateFormField(
                  dateController: _dateOfJoin,
                  label: 'Date  of join',
                ),
                SizedBox(height: 10),
                MyTextField(label: "College mail"),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
