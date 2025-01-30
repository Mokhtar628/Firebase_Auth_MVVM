import 'package:flutter/material.dart';
import 'package:pureminds/features/auth/views/pages/signin_view.dart';
import 'package:pureminds/features/auth/views/pages/signup_view.dart';




class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInView(),
                  ),
                );
              },
              child: const Text("Sign In"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpView(),
                  ),
                );
              },
              child: const Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
