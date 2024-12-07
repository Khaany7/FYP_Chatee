import 'package:chatee/features/auth/screens/login_screen.dart';
import 'package:chatee/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome to Chatee',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              'assets/illustration.png',
              height: 250,
              width: 340,
            ),
            SizedBox(height: size.height / 100),
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Break the boundaries and connect with people all over the world.',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: CustomButton(
                text: "GET STARTED",
                onPressed: () => navigateToLoginScreen(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
