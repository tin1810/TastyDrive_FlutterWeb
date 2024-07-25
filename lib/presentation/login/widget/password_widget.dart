import 'package:flutter/material.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  final bool isObscure;
  final TextEditingController passwordController;
  final Function onPressedVisibleIcon;
  final Function onChanged;
  final bool isConfirm;

  const PasswordTextFieldWidget({
    super.key,
    required this.isObscure,
    this.isConfirm = false,
    required this.passwordController,
    required this.onPressedVisibleIcon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isConfirm ? "Confirm Password" : "Password",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            cursorColor: Colors.green,
            onChanged: (text) {
              onChanged();
            },
            obscureText: isObscure,
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return isConfirm
                    ? "Please Confirm Password"
                    : "Please Enter Password";
              } else if (value == "123456") {
                return "Password is too easy";
              } else if (value.length < 6) {
                return "Password is too short";
              } else if (value.length == 6 && value != "123456") {
                return "Password is strong";
              }
              return null;
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              filled: true,
              fillColor: Colors.grey.shade100,
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: isObscure ? Colors.grey : Colors.green,
                ),
                onPressed: () {
                  onPressedVisibleIcon();
                },
              ),
              hintText: isConfirm ? "Enter Confirm Password" : "Enter Password",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color.fromRGBO(17, 17, 35, 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.green),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
