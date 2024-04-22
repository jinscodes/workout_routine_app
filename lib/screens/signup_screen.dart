import 'package:flutter/material.dart';
import 'package:workout_app/common/color.dart';
import 'package:workout_app/common/login_text_field.dart';
import 'package:workout_app/common/next_button.dart';
import 'package:workout_app/screens/login_screen.dart';
import 'package:workout_app/utilities/api.dart';
import 'package:workout_app/utilities/complete_page.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();
  bool isText = false;
  bool isError = false;
  bool isLoad = false;

  _signupValidation() async {
    try {
      Map<String, dynamic> res = await PostApi(
        apiUrl: "/signup",
        body: {
          "userId": idController.text,
          "password": pwController.text,
          "nickname": nameController.text,
        },
      ).postData();

      if (res["userId"] != null) {
        _navigateToCompleteSignup();
      } else {
        // will do
        // ignore: avoid_print
        print("fail");
      }
    } catch (e) {
      // ignore: avoid_print
      print("Err: $e");

      return showSnackBar(context, "Login failed 🥲");
    }
  }

  void _navigateToCompleteSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompletePage(
          navigator: _navigateToLogin,
          buttonTitle: "Login",
        ),
      ),
    );
  }

  void _navigateToLoginWithId() {
    Navigator.of(context).pop();
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  // @override
  // void dispose() {
  //   idController.dispose();
  //   pwController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => _navigateToLoginWithId(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          "Create Account",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: ColorTheme.loginBgGray,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
          child: Center(
            child: Column(
              children: [
                Flexible(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        LoginTextField(
                          controller: nameController,
                          title: "NAME",
                          isError: isError,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                          controller: idController,
                          title: "ID",
                          isError: isError,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LoginTextField(
                          controller: pwController,
                          title: "PW",
                          isError: isError,
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      NextButton(
                        content: "Next",
                        handlePressed: () {
                          _signupValidation();
                        },
                      ),
                    ],
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

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: ColorTheme.errorRed,
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      duration: const Duration(
        seconds: 2,
      ),
    ),
  );
}
