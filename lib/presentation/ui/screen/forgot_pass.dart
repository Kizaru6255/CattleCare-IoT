// ignore_for_file: use_build_context_synchronously

import 'package:cow_1/presentation/ui/utility/image_base_url.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassScreen extends StatefulWidget {
  @override
  _ForgotPassScreenState createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to handle password reset
  Future<void> resetPassword() async {
    try {
      if (_formKey.currentState!.validate()) {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim(),
        );
        Navigator.pop(context);

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Password reset email sent successfully.")),
        );
        emailController.clear();
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("This email does not exist.")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to send password reset email.")),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to send password reset email.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageURL.registrationBG),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageURL.cowHead),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 45),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              // labelText: 'Email',
                              hintText: 'Email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 58),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            onPressed: resetPassword,
                            child: const Text(
                              'Send Mail',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "Or",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Sign In",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     const SizedBox(height: 45),
      //     Image.asset('assets/images/your_image.png', height: 279),
      //     const Center(
      //       child: Text(
      //         "Reset Password",
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 14),
      //     Expanded(
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.teal[600],
      //           borderRadius: const BorderRadius.only(
      //             topLeft: Radius.circular(35),
      //             topRight: Radius.circular(35),
      //           ),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.black.withOpacity(0.50),
      //               blurRadius: 6,
      //               offset: const Offset(0, 2),
      //             ),
      //           ],
      //         ),
      //         child: SingleChildScrollView(
      //           child: Padding(
      //             padding: const EdgeInsets.all(16),
      //             child: Form(
      //               key: _formKey,
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.stretch,
      //                 children: [
      //                   const SizedBox(height: 45),
      //                   TextFormField(
      //                     controller: emailController,
      //                     keyboardType: TextInputType.emailAddress,
      //                     decoration: InputDecoration(
      //                       labelText: 'Email',
      //                       filled: true,
      //                       fillColor: Colors.white,
      //                       border: OutlineInputBorder(
      //                         borderRadius: BorderRadius.circular(25),
      //                       ),
      //                     ),
      //                     validator: (value) {
      //                       if (value == null || value.isEmpty) {
      //                         return 'Please enter your email';
      //                       }
      //                       return null;
      //                     },
      //                   ),
      //                   const SizedBox(height: 58),
      //                   ElevatedButton(
      //                     style: ButtonStyle(
      //                       backgroundColor: MaterialStateProperty.all(Colors.black),
      //                     ),
      //                     onPressed: resetPassword,
      //                     child: const Text(
      //                       'Send Mail',
      //                       style: TextStyle(color: Colors.white, fontSize: 14),
      //                     ),
      //                   ),
      //                   const SizedBox(height: 16),
      //                   const Text(
      //                     "Or",
      //                     textAlign: TextAlign.center,
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                   GestureDetector(
      //                     onTap: () {
      //                       Navigator.pop(context);
      //                     },
      //                     child: const Text(
      //                       "Sign In",
      //                       textAlign: TextAlign.center,
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontFamily: 'Inter',
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
