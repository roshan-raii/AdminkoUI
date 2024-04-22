import 'package:admin/presentations/widgets/button.dart';
import 'package:admin/presentations/widgets/textfield.dart';
import 'package:admin/presentations/Screen/Login%20and%20otp/otp_codeScreen.dart';
import 'package:admin/Services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpEmailPage extends StatefulWidget {
  const OtpEmailPage({super.key});

  @override
  State<OtpEmailPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpEmailPage> {
  final TextEditingController emailController = TextEditingController();

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
                "assets/images/otp.png",
                height: 300,
              ),
              Text(
                "Enter your email",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
              Text(
                "A verification code will be sent to the email address you provide",
                style: GoogleFonts.lato(
                  fontSize: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 500.0),
                child: MyTextField(
                  controller: emailController,
                  label: 'you@example.com',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email),
                  validator: ValidationService.validateEmail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 500.0),
                child: InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => OtpCodeScreen()));
                    }
                  },
                  child: SizedBox(
                    height: 50,
                    child: const MyButton(
                      color: Color.fromARGB(255, 47, 14, 105),
                      text: "Send verification code",
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
      ),
    );
  }
}
