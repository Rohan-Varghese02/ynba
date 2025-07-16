import 'package:flutter/material.dart';
import 'package:ynba/core/colors/colors.dart';
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
          onTap: (){
            // Goes to register Page
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
