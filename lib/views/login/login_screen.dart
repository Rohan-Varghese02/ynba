import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/services/auth_service.dart';
import 'package:ynba/views/home/home_screen.dart';
import 'package:ynba/views/login/widget/google_btn.dart';
import 'package:ynba/views/login/widget/login_footer.dart';
import 'package:ynba/views/widgets/heading_password_field.dart';
import 'package:ynba/views/widgets/heading_text_field.dart';
import 'package:ynba/views/widgets/style_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.95;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyleText(text: 'Login', size: 30, fontWeight: FontWeight.bold),
                SizedBox(height: 20),

                StyleText(
                  text:
                      'Login now to track all your expenses and income at a place!',
                  size: 15,
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(height: 20),

                HeadingTextField(
                  headline: 'Email',
                  controller: emailController,
                  hint: 'Ex: abc@example.com',
                ),
                SizedBox(height: 20),
                HeadingPasswordField(
                  headline: 'Your Password',
                  hint: '*********',
                  controller: passController,
                  onPressed: () {},
                  isVisible: true,
                ),
                SizedBox(height: 10),

                StyleText(
                  text: 'Forgot Password?',
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryDark,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(width, 60)),
                  onPressed: () async {
                    log(emailController.text);
                    log(passController.text);
                    final response = await AuthService().login(
                      emailController.text,
                      passController.text,
                    );
                    if (response.containsKey('token')) {
                      log('✅ Logged in! Token: ${response['token']}');
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email or password invalid')),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
                GoogleBtn(),
                SizedBox(height: 20),
                LoginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
