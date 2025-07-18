import 'package:flutter/material.dart';
import 'package:ynba/core/theme/theme.dart';
import 'package:ynba/services/auth_gate.dart';
import 'package:ynba/views/boarding/boarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: AuthGate(),
      debugShowCheckedModeBanner: false,
    );
  }
}
