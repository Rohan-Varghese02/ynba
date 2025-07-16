import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ynba/core/colors/colors.dart';
import 'package:ynba/views/login/login_screen.dart';
import 'package:ynba/views/splash/widgets/writing_text_animation.dart';
import 'package:ynba/views/widgets/style_text.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController navigateController;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    typeWrittingAnimation();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    navigateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    scaleAnimation = Tween<double>(
      begin: 1,
      end: 10,
    ).animate(navigateController);
    navigateController.addListener(() {
      if (navigateController.isCompleted) {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const LoginScreen();
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
          ),
        );
      }
    });
  }

  int _currentIndex = 0;
  int _currentCharIndex = 0;
  bool isComplete = false;
  bool _showCursor = true;
  bool isText = true;
  final List<String> headline = [
    'Track your spending with ease',
    'Visualize where your money goes',
    'Press Get Started to Use MONEY wisely',
  ];

  void typeWrittingAnimation() {
    if (_currentCharIndex < headline[_currentIndex].length) {
      _currentCharIndex++;
      setState(() {});
      Future.delayed(const Duration(milliseconds: 150), () {
        if (!isComplete) typeWrittingAnimation();
      });
    } else {
      if (_currentIndex < headline.length - 1) {
        // Pause for 2 seconds before starting next sentence
        Future.delayed(const Duration(milliseconds: 1000), () {
          _currentIndex++;
          _currentCharIndex = 0;
          setState(() {});
          typeWrittingAnimation();
        });
      } else {
        // Final message complete
        isComplete = true;
        setState(() {
          _showCursor = false;
        });
        controller.forward(); // Start fade-in animation for button
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        width: width,
        height: double.infinity,
        decoration: BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/Boarding_screen_human.png')),
              WritingTextAnimation(
                headline: headline,
                currentIndex: _currentIndex,
                currentCharIndex: _currentCharIndex,
                showCursor: _showCursor,
              ),
              SizedBox(height: 40),
              if (isComplete)
                FadeTransition(
                  opacity: opacityAnimation,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isText = false;
                        });
                        navigateController.forward();
                      },
                      child: ScaleTransition(
                        scale: scaleAnimation,
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white,
                          ),
                          child: Center(
                            child: StyleText(
                              text: isText ? 'Get Started' : '',
                              size: 20,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
