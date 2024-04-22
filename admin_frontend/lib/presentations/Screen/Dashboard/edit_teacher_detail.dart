import 'package:admin/Services/validation_service.dart';
import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/dateField.dart';
import 'package:flutter/material.dart';
import 'package:admin/presentations/widgets/dropDown.dart';
import 'package:admin/presentations/widgets/textfield.dart';

class EditTeacherDetails extends StatefulWidget {
  const EditTeacherDetails({Key? key}) : super(key: key);

  @override
  State<EditTeacherDetails> createState() => _EditTeacherDetailsState();
}

class _EditTeacherDetailsState extends State<EditTeacherDetails> {
  final TextEditingController _dateOfBirth = TextEditingController();
  final TextEditingController _dateOfJoin = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _contactNumber = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _teacherId = TextEditingController();
  final TextEditingController _module = TextEditingController();
  final TextEditingController _collegeMail = TextEditingController();
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
              _buildSectionTitle('Teacher Profile', 'Edit Profile'),
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
                DropDownGender(),
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
                  label: "Teacher id",
                  controller: _teacherId,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 11),
                DropDownFaculty(),
                SizedBox(height: 11),
                MyTextField(
                  label: "Module",
                  controller: _module,
                  validator: ValidationService.validateNonEmptiness,
                ),
                SizedBox(height: 9),
                DateFormField(
                  dateController: _dateOfJoin,
                  label: 'Date  of join',
                ),
                SizedBox(height: 10),
                MyTextField(
                  label: "College mail",
                  controller: _collegeMail,
                  validator: ValidationService.validateEmail,
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
