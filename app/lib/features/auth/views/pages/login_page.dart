import 'package:app/features/auth/views/widgets/credential_fields.dart';
import 'package:app/features/auth/views/widgets/social_icon.dart';
import 'package:app/features/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Airbnb",
                      style: GoogleFonts.roboto(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    // for phone number field,
                    CredentialFields(
                      phoneController: phoneController,
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text:
                            "We'll call or text you to conform your number. Standart message and data rates apply.  ",
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Privacy Policy",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    InkWell(
                      onTap: () {
                        if(phoneController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                          if(phoneController.text != "9876543210" || passwordController.text != 
                          " Test@123") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Invalid credentials"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainPage(),
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFDF4058),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.026),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black26,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "or",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black26,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    SocialIcon(
                      size: size,
                      icon: Icons.facebook,
                      name: "Continue with Facebook",
                      color: Colors.blue,
                      iconSize: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: SocialIcon(
                        size: size,
                        icon: Icons.g_mobiledata,
                        name: "Continue with Google",
                        color: Colors.pink,
                        iconSize: 27,
                      ),
                    ),
                    SocialIcon(
                      size: size,
                      icon: Icons.apple,
                      name: "Continue with Apple",
                      color: Colors.black,
                      iconSize: 30,
                    ),
                    SocialIcon(
                      size: size,
                      icon: Icons.email_outlined,
                      name: "Continue with email",
                      color: Colors.black,
                      iconSize: 30,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "Signup?",
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
