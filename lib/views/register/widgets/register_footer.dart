import 'package:flutter/material.dart';
import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/views/widgets/style_text.dart';

class RegisterFooter extends StatelessWidget {
  const RegisterFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StyleText(
          text: 'Already have an account? ',
          color: AppColors.primaryDark,
        ),
        GestureDetector(
          onTap: () {
            // login
          },
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: StyleText(
              text: 'Login',
              decoration: TextDecoration.underline,
              color: AppColors.primaryDark,
            ),
          ),
        ),
      ],
    );
  }
}
