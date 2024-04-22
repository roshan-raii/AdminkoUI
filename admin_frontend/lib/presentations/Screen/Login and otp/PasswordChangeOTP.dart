import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:admin/presentations/Screen/Login%20and%20otp/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPpasswordChange extends StatefulWidget {
  OTPpasswordChange({super.key});

  @override
  State<OTPpasswordChange> createState() => _OTPpasswordChangeState();
}

class _OTPpasswordChangeState extends State<OTPpasswordChange> {
  final newPasswordController = TextEditingController();

  final confirmNewpasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool obscurePassword = true;
  Icon visible = const Icon(Icons.visibility, color: Colors.black);
  Icon nonVisible = const Icon(Icons.visibility_off, color: Colors.black);

  Widget toggleButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: IconButton(
        icon: obscurePassword ? visible : nonVisible,
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 125.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter your new password",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [Text("New password")],
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      label: "New password",
                      controller: newPasswordController,
                      suffixIcon: toggleButton(),
                      obscureText: obscurePassword,
                      validator: (val) {
                        if (val!.isEmpty)
                          return 'Enter new password';
                        else if (val.length < 6) {
                          return "Password must be atleast 6 characters long";
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [Text("Confirm password")],
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextField(
                      label: "Confirm new password",
                      controller: confirmNewpasswordController,
                      obscureText: obscurePassword,
                      suffixIcon: toggleButton(),
                      validator: (val) {
                        if (val!.isEmpty)
                          return 'Enter new password';
                        else if (val.length < 6) {
                          return "Password must be atleast 6 characters long";
                        }
                        if (val != newPasswordController.text)
                          return 'Password does not match';
                        return null;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      }
                    },
                    child: SizedBox(
                      height: 50,
                      child: const MyButton(
                        color: Color.fromARGB(255, 47, 14, 105),
                        text: "Next",
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/newPasswordOtp.png"),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
