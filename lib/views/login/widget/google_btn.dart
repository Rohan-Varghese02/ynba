import 'package:flutter/material.dart';
import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/views/widgets/style_text.dart';

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.92;
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryDark, width: 3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/Google_logo.svg'),
            width: 24,
            height: 24,
          ),
          SizedBox(width: 5),
          StyleText(text: 'Continue with Google', size: 20),
        ],
      ),
    );
  }
}
