import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pureminds/features/auth/views/pages/onboarding_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => OnboardingScreen(initialPage: 2,),),
                    (Route<dynamic> route) => false,
              ); // Replace with the sign-in page
            },
          )
        ],
      ),
      body: Center(
        child: user == null
            ? Text("No user signed in")
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, ${user.displayName ?? 'User'}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              "Email: ${user.email}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
