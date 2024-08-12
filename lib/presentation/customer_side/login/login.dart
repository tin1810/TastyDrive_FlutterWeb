import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/widget/email_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/widget/password_widget.dart';
import 'package:tasty_drive_website/presentation/customer_side/login/widget/sign_up_dialog.dart';

class LoginViewWidget extends StatefulWidget {
  final Function onChangeEmail, onChangePassword, onTapLogin;
  final TextEditingController emailController, passwordController;

  const LoginViewWidget({
    super.key,
    required this.onChangeEmail,
    required this.onChangePassword,
    required this.emailController,
    required this.passwordController,
    required this.onTapLogin,
  });

  @override
  State<LoginViewWidget> createState() => _LoginViewWidgetState();
}

class _LoginViewWidgetState extends State<LoginViewWidget> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Container(
          width: 400,
          height: 400,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(3, 108, 48, 0.882),
                Color.fromRGBO(13, 154, 183, 0.89),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
              EmailTextFieldWidget(
                emailController: widget.emailController,
                onChanged: () {
                  widget.onChangeEmail();
                },
              ),
              PasswordTextFieldWidget(
                isObscure: isObscure,
                passwordController: widget.passwordController,
                onPressedVisibleIcon: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                onChanged: () {
                  widget.onChangePassword();
                },
              ),
              MaterialButton(
                color: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                onPressed: () {
                  widget.onTapLogin();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(color: Colors.white, fontSize: 14.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Register!',
                      style:
                          const TextStyle(color: Colors.amber, fontSize: 14.0),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                          signupDialog();
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
