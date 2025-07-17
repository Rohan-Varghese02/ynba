import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WritingTextAnimation extends StatelessWidget {
  final List<String> headline;
  final int currentIndex;
  final int currentCharIndex;
  final bool showCursor;
  const WritingTextAnimation({
    super.key,
    required this.headline,
    required this.currentIndex,
    required this.currentCharIndex,
    required this.showCursor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.bebasNeue(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        children: [
          TextSpan(text: headline[currentIndex].substring(0, currentCharIndex)),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: showCursor ? 1.0 : 0.0,
              child: Container(
                width: showCursor ? 15 : 0,
                height: 45,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
