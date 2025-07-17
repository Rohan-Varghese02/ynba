import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ynba/views/boarding/boarding_screen.dart';
import 'package:ynba/views/home/home_screen.dart';
import 'package:ynba/views/login/login_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool? isFirstTime; // Make it nullable to track loading state
  String? token;
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    _checkFirstTimeStatus();
  }

  Future<void> _checkFirstTimeStatus() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final bool firstTimeStatus = sharedPreferences.getBool('first') ?? false;
    final jwtoken = await storage.read(key: 'token');
    setState(() {
      isFirstTime = firstTimeStatus;
      token = jwtoken;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstTime == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // Navigate based on first time status
    if (isFirstTime!) {
      if (token != null) {
        return HomeScreen();
      }
      return LoginScreen();
    } else {
      return BoardingScreen();
    }
  }
}
