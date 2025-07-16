import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ynba/core/colors/colors.dart';

class StyleText extends StatelessWidget {
  final TextDecoration? decoration;
  final String text;
  final Color? color;
  final bool? softWrap;
  final double? size;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final int? maxLines;
  const StyleText({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.decoration,
    this.overflow,
    this.maxLines,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      style: GoogleFonts.inter(
        color: color ?? AppColors.textPrimary,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
