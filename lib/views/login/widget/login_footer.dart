import 'package:flutter/material.dart';
import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/views/register/register_screen.dart';
import 'package:ynba/views/widgets/style_text.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StyleText(
          text: 'Don\'t have an account? ',
          color: AppColors.primaryDark,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RegisterScreen()))
                .then((value) {
                  if (value == 'registered') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Registration successful. Please login.'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                });
          },
          child: StyleText(
            text: 'Register',
            decoration: TextDecoration.underline,
            color: AppColors.primaryDark,
          ),
        ),
      ],
    );
  }
}
