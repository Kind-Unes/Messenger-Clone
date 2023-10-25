import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';

class JoinFacebookFirst extends StatelessWidget {
  const JoinFacebookFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              width: 150, // Set the width as per your requirement
              height: 150, // Set the height as per your requirement
              child: Image.asset(
                'assets/images/Facebook_Logo_Primary.png', // Replace with the path to your image
                fit: BoxFit
                    .cover, // BoxFit.cover to maintain aspect ratio and cover the container
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Join Facebook",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "We'll help you create a new account in a few easy steps.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 80, 80, 80),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 30,
            ),
            MyDefaultButton(
                onClicked: () {
                  (context).goNamed("FullName");
                },
                buttonColor: MyColors.primaryColor,
                textColor: Colors.white,
                width: double.infinity,
                text: "Next"),
            const SizedBox(
              height: 250,
            ),
            MyDefaultButton(
                onClicked: () {
                  (context).goNamed("LogIn");
                },
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Already have an account?")
          ]),
        ),
      ),
    );
  }
}
