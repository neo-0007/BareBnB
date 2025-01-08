import 'package:flutter/material.dart';

class SignupCredentialFields extends StatelessWidget {
  const SignupCredentialFields({super.key, required this.emailController, required this.passwordController, required this.confirmPasswordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 185, // Reduced height
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black45,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black45,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
                border: InputBorder.none,
              ),
            ),
                        const Divider(
              color: Colors.black45,
            ),
            TextFormField(
              obscureText: true,
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
  }


    