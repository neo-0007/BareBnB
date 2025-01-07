import 'package:flutter/material.dart';

class CredentialFields extends StatelessWidget {
  const CredentialFields({super.key, required this.phoneController, required this.passwordController});

  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130, // Reduced height
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone number",
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
            )
          ],
        ),
      ),
    );
  }
  }


    