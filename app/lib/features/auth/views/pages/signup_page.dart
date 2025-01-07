import 'package:app/features/auth/repositories/firebase_auth_repository.dart';
import 'package:app/features/auth/services/firebase_auth_service.dart';
import 'package:app/features/auth/views/pages/login_page.dart';
import 'package:app/features/auth/views/widgets/auth_button.dart';
import 'package:app/features/auth/views/widgets/signup_credential_fields.dart';
import 'package:app/features/auth/views/widgets/social_icon.dart';
import 'package:app/features/main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late final AuthRepository authRepository;

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository(AuthService());
  }

  Future<void> signup(String email, String password) async {
    try {
      final user = await authRepository.signup(email, password);
      if (user != null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Account Created"),
          ),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                    SignupCredentialFields(
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(height: size.height * 0.03),
                    AuthButton(
                        onPressed: () {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              confirmPasswordController.text.isNotEmpty) {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              signup(
                                emailController.text,
                                passwordController.text,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Passwords do not match"),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("Please fill all the fields"),
                              ),
                            );
                          }
                        },
                        text: 'Sign Up'),
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
                      onTap: () {},
                    ),
                    SocialIcon(
                      onTap: () {},
                      size: size,
                      icon: Icons.g_mobiledata,
                      name: "Continue with Google",
                      color: Colors.pink,
                      iconSize: 27,
                    ),
                    SocialIcon(
                      onTap: () {},
                      size: size,
                      icon: Icons.apple,
                      name: "Continue with Apple",
                      color: Colors.black,
                      iconSize: 30,
                    ),
                    SocialIcon(
                      onTap: () {},
                      size: size,
                      icon: Icons.email_outlined,
                      name: "Continue with email",
                      color: Colors.black,
                      iconSize: 30,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Login?",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              decoration: TextDecoration.underline),
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
