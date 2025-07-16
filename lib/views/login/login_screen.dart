import 'package:flutter/material.dart';
import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/views/login/widget/google_btn.dart';
import 'package:ynba/views/login/widget/login_footer.dart';
import 'package:ynba/views/widgets/heading_password_field.dart';
import 'package:ynba/views/widgets/heading_text_field.dart';
import 'package:ynba/views/widgets/style_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.95;
    TextEditingController emailcontroller = TextEditingController();
    return Scaffold(
      body: SafeArea(
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
                controller: emailcontroller,
                hint: 'Ex: abc@example.com',
              ),
              SizedBox(height: 20),
              HeadingPasswordField(
                headline: 'Your Password',
                hint: '*********',
                controller: emailcontroller,
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
                onPressed: () {},
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
    );
  }
}
