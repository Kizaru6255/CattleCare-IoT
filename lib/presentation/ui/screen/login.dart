import 'package:cow_1/presentation/ui/screen/forgot_pass.dart';
import 'package:cow_1/presentation/ui/screen/shedDetails.dart';
import 'package:cow_1/presentation/ui/utility/image_base_url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  /// Save login state and user ID in SharedPreferences
  Future<void> _saveLoginState(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userId', userId);
  }

  Future<void> _loginWithEmailPassword(String email, String password) async {
    setState(() {
      isLoading = true;
    });

    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Save login state and user ID
      await _saveLoginState(userCredential.user!.uid);

      Get.offAll(ShedDetails());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "An error occurred"),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _loginWithGoogle() async {
    setState(() {
      isLoading = true;
    });

    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in process
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save login state and user ID
      await _saveLoginState(userCredential.user!.uid);

      Get.offAll(ShedDetails());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Google Sign-In failed. Please try again."),
        ),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
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
                // Upper part of the screen
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

                // Lower part of the screen
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "  Email",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            cursorColor: Colors.yellow,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xffd8d7e9)),
                              ),
                              hintText: "cow@cow.com",
                              hintStyle:
                                  const TextStyle(color: Color(0xff868686)),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Password",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            cursorColor: Colors.yellow,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Color(0xffd8d7e9)),
                              ),
                              hintText: "*********",
                              hintStyle:
                                  const TextStyle(color: Color(0xff868686)),
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff198319),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      _loginWithEmailPassword(
                                        emailController.text,
                                        passwordController.text,
                                      );
                                    },
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Sign In",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Center(
                            child: Text(
                              "or",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      _loginWithGoogle();
                                    },
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/google_icon.jpg',
                                          height: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "Continue with Google",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                               Get.to(ForgotPassScreen());
                            },
                            child: const Center(
                                child: Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white),
                            )),
                          )
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
    );
  }
}
