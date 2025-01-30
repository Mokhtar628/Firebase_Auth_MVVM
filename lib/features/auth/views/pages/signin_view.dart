import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../home_page.dart';
import '../../view_models/auth_view_model.dart';
import '../widgets/auth_form.dart';

class SignInView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: null,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AuthForm(
        emailController: emailController,
        passwordController: passwordController,
        isSignUp: false,
        onSubmit: () async {
          try {
            await authViewModel.signIn(
              emailController.text,
              passwordController.text,
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false,
            );

          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.toString()),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
