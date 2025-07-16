import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/views/widgets/style_text.dart';

class HeadingPasswordField extends StatefulWidget {
  final bool isVisible;
  final String headline;
  final String hint;
  final TextEditingController controller;
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  const HeadingPasswordField({
    super.key,
    required this.headline,
    required this.hint,
    required this.controller,
    required this.onPressed,
    required this.isVisible,
    this.validator,
  });

  @override
  State<HeadingPasswordField> createState() => _HeadingPasswordFieldState();
}

class _HeadingPasswordFieldState extends State<HeadingPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyleText(text: widget.headline, size: 16, fontWeight: FontWeight.w500),
        TextFormField(
          validator: widget.validator,
          obscureText: widget.isVisible,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.textPrimary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textPrimary),
            ),
            hintText: widget.hint,
            hintStyle: GoogleFonts.poppins(
              color: AppColors.textPrimary,
              fontSize: 16,
            ),
            suffixIcon: widget.isVisible
                ? IconButton(
                    icon: Icon(Icons.visibility_outlined),
                    color: AppColors.textPrimary,
                    onPressed: widget.onPressed,
                  )
                : IconButton(
                    icon: Icon(Icons.visibility_off_outlined),
                    color: AppColors.textPrimary,
                    onPressed: widget.onPressed,
                  ),
          ),
        ),
      ],
    );
  }
}
