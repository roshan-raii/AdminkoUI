import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:admin/presentations/Screen/Login%20and%20otp/PasswordChangeOTP.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpCodeScreen extends StatelessWidget {
  OtpCodeScreen({super.key});

  final TextEditingController otpController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/otp_verification.png",
                  height: 300,
                ),
                Text(
                  "Check your email",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                Text(
                  "Please enter verification code that was sent on provided email",
                  style: GoogleFonts.lato(
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 500.0),
                  child: MyTextField(
                    controller: otpController,
                    label: 'Verification code',
                    keyboardType: TextInputType.number,
                    prefixIcon: const Icon(Icons.message),
                    validator: ValidationService.validateOTP,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 500.0),
                  child: InkWell(
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => OTPpasswordChange()));
                      }
                    },
                    child: SizedBox(
                      height: 50,
                      child: const MyButton(
                        color: Color.fromARGB(255, 47, 14, 105),
                        text: "Verify code",
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ));
  }
}
