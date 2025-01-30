import 'package:flutter/material.dart';
import 'package:pureminds/core/paints/app_colors.dart';
import 'package:pureminds/features/auth/views/pages/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.primary,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: Image.asset(
                'assets/logos/app_logo.png',
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}