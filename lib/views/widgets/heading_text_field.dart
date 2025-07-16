import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/views/widgets/style_text.dart';

class HeadingTextField extends StatelessWidget {
  final String hint;
  final String headline;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  const HeadingTextField({
    super.key,
    required this.headline,
    required this.controller,
    required this.hint,
    this.validator,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyleText(text: headline, size: 16, fontWeight: FontWeight.w500),
        TextFormField(
          
          readOnly: readOnly ?? false,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppColors.textPrimary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textPrimary),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.inter(
              color: AppColors.textPrimary,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
