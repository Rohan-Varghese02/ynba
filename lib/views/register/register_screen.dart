import 'package:flutter/material.dart';
import 'package:ynba/services/auth_service.dart';
import 'package:ynba/views/register/widgets/register_footer.dart';
import 'package:ynba/views/widgets/heading_password_field.dart';
import 'package:ynba/views/widgets/heading_text_field.dart';
import 'package:ynba/views/widgets/style_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.95;

    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyleText(
                text: 'Register',
                size: 30,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 20),

              StyleText(
                text: 'Create an account to access all the features of Linear!',
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

              // HeadingTextField(
              //   headline: 'Your Name',
              //   controller: emailController,
              //   hint: 'Ex. Vicky Aman',
              // ),
              //SizedBox(height: 20),
              HeadingPasswordField(
                headline: 'Your Password',
                hint: '*********',
                controller: passController,
                onPressed: () {},
                isVisible: true,
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(width, 60)),
                onPressed: () async {
                  final response = await AuthService().register(
                    emailController.text,
                    passController.text,
                  );
                  if (response.containsKey('msg')) {
                    print('✅ Register: ${response['msg']}');
                    Navigator.pop(context, 'registered');
                  } else {
                    print('❌ Error: ${response['error'] ?? response['msg']}');
                  }
                },
                child: Text('Register'),
              ),
              SizedBox(height: 20),
              RegisterFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
