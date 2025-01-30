import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/paints/app_colors.dart';
import '../../../../core/validators/auth_validation.dart';
import '../../../../core/widgets/reusable_button.dart';
import '../../../../core/widgets/reusable_input_form.dart';
import '../../view_models/auth_view_model.dart';
import '../pages/onboarding_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/paints/app_colors.dart';
import '../../../../core/validators/auth_validation.dart';
import '../../../../core/widgets/reusable_button.dart';
import '../../../../core/widgets/reusable_input_form.dart';
import '../../view_models/auth_view_model.dart';
import '../pages/onboarding_screen.dart';

class AuthForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final bool isSignUp;
  final VoidCallback onSubmit;

  const AuthForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.firstNameController,
    this.lastNameController,
    required this.isSignUp,
    required this.onSubmit,
  });

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(),
        leading: Container(),
      ),
      body: Stack(
        children: [
          // Background Image (disappear behind appbar)
          Container(
            height: screenHeight * (widget.isSignUp? 0.5:0.6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/${widget.isSignUp ? "auth_image" : "sign_auth"}.jpg',
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          // Transparent gradient on top of the image
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  widget.isSignUp ? Colors.black.withOpacity(0.24) : Colors.transparent,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Auth Form as a widget
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Form content
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.isSignUp ? "Create Your Account" : "Sign In",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                              size: 28,
                            ),
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OnboardingScreen(initialPage: 2),
                                ),
                                    (Route<dynamic> route) => false,
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: widget.isSignUp ? 16 : 0),
                      if (widget.isSignUp)
                        Row(
                          children: [
                            Expanded(
                              child: ReusableInputField(
                                controller: widget.firstNameController,
                                labelText: 'First Name',
                                keyboardType: TextInputType.name,
                                validator: Validators.validateName,
                                heightPadding: 5,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ReusableInputField(
                                controller: widget.lastNameController,
                                labelText: 'Last Name',
                                keyboardType: TextInputType.name,
                                validator: Validators.validateName,
                                heightPadding: 5,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: 16),
                      ReusableInputField(
                        controller: widget.emailController,
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: Validators.validateEmail,
                      ),
                      const SizedBox(height: 16),
                      ReusableInputField(
                        controller: widget.passwordController,
                        labelText: 'Password',
                        keyboardType: TextInputType.text,
                        validator: Validators.validatePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      if (widget.isSignUp)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: "By tapping Sign up you accept all ",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: "terms ",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "and ",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "conditions",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (!widget.isSignUp)
                        Text(
                          "Forget Password?",
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      const SizedBox(height: 16),
                      // The button to appear at the bottom
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ReusableButton(
                          text: widget.isSignUp ? 'CREATE AN ACCOUNT' : 'SIGN IN',
                          onPressed: authViewModel.isLoading
                              ? () {} // Disable the button if loading
                              : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              widget.onSubmit(); // Submit the form
                            }
                          },
                          isLoading: authViewModel.isLoading,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




// class AuthForm extends StatefulWidget {
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   final TextEditingController? firstNameController;
//   final TextEditingController? lastNameController;
//   final bool isSignUp;
//   final VoidCallback onSubmit;
//
//   const AuthForm({
//     super.key,
//     required this.emailController,
//     required this.passwordController,
//     this.firstNameController,
//     this.lastNameController,
//     required this.isSignUp,
//     required this.onSubmit,
//   });
//
//   @override
//   _AuthFormState createState() => _AuthFormState();
// }
//
// class _AuthFormState extends State<AuthForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final authViewModel = Provider.of<AuthViewModel>(context);
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       showModalBottomSheet(
//         barrierColor: Colors.transparent,
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent, // No background blur
//         isDismissible: false, // Prevent closing
//         enableDrag: false, // Disable dragging to close
//         builder: (context) => WillPopScope(
//           onWillPop: () async => false,
//           child: Padding(
//             padding: EdgeInsets.only(
//               top: 30.0,
//               bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard height
//             ),
//             child: Container(
//               padding: const EdgeInsets.all(25.0),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//               ),
//               constraints: BoxConstraints(
//                 maxHeight: screenHeight * (widget.isSignUp ? 0.6 : 0.5),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min, // Allow the layout to shrink
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             widget.isSignUp ? "Create Your Account" : "Sign In",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           IconButton(
//                             icon: Icon(
//                               Icons.cancel,
//                               color: Colors.black,
//                               size: 28,
//                             ),
//                             onPressed: () {
//                               Navigator.pushAndRemoveUntil(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => OnboardingScreen(initialPage: 2),
//                                 ),
//                                     (Route<dynamic> route) => false,
//                               );
//
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: widget.isSignUp? 16:0),
//                       if (widget.isSignUp)
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ReusableInputField(
//                                 controller: widget.firstNameController,
//                                 labelText: 'First Name',
//                                 keyboardType: TextInputType.name,
//                                 validator: Validators.validateName,
//                                 heightPadding: 5,
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Expanded(
//                               child: ReusableInputField(
//                                 controller: widget.lastNameController,
//                                 labelText: 'Last Name',
//                                 keyboardType: TextInputType.name,
//                                 validator: Validators.validateName,
//                                 heightPadding: 5,
//                               ),
//                             ),
//                           ],
//                         ),
//                       const SizedBox(height: 16),
//                       // Email field
//                       ReusableInputField(
//                         controller: widget.emailController,
//                         labelText: 'Email',
//                         keyboardType: TextInputType.emailAddress,
//                         validator: Validators.validateEmail,
//                       ),
//                       const SizedBox(height: 16),
//                       // Password field
//                       ReusableInputField(
//                         controller: widget.passwordController,
//                         labelText: 'Password',
//                         keyboardType: TextInputType.text,
//                         validator: Validators.validatePassword,
//                         obscureText: true,
//                       ),
//                       const SizedBox(height: 16),
//                       // Terms and conditions text
//                       if (widget.isSignUp)
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
//                           child: RichText(
//                             textAlign: TextAlign.center, // Center-align the text
//                             text: TextSpan(
//                               text: "By tapping Sign up you accept all ",
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.black,
//                               ),
//                               children: [
//                                 TextSpan(
//                                   text: "terms ",
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: AppColors.primary, // Highlight color for "terms"
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "and ", // "and" retains the default context color
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black, // Match default color
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: "conditions",
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: AppColors.primary, // Highlight color for "conditions"
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//
//                       if (!widget.isSignUp)
//                         Text(
//                           "Forget Password?",
//                           style: const TextStyle(
//                             fontSize: 14,
//                             color: AppColors.primary,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//
//                       const SizedBox(height: 16),
//                       ReusableButton(
//                         text: widget.isSignUp ? 'CREATE AN ACCOUNT' : 'SIGN IN',
//                         onPressed: authViewModel.isLoading
//                             ? () {}  // Disable the button if loading by passing an empty function
//                             : () {
//                           if (_formKey.currentState?.validate() ?? false) {
//                             widget.onSubmit(); // Perform the form submission action
//                           }
//                         },
//                         isLoading: authViewModel.isLoading, // Pass the loading state to show the indicator
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//
//     return Container(
//       height: screenHeight * (widget.isSignUp ? 0.5 : 0.6),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(
//             'assets/images/${widget.isSignUp ? "auth_image" : "sign_auth"}.jpg',
//           ),
//           fit: BoxFit.cover,
//           alignment: Alignment.topCenter,
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               widget.isSignUp? Colors.black.withOpacity(0.24): Colors.transparent,
//               Colors.transparent,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }