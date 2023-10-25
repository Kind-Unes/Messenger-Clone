import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/authentication_service.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/providers.dart';

class JoinFacebookLast extends ConsumerWidget {
  const JoinFacebookLast({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future createUserWithEmailAndPassowrd() async {
      final authService = ref.read(authServiceProvider);
      final result = await authService.createUserWithEmailAndPassword(
          ref.read(emailProvider),
          ref.read(passwordProvider),
          ref.read(firstNameProvider),
          ref.read(lastNameProvider),
          ref.read(profileURLProvider),
          ref.read(genderProvider));
      result.fold((l) {}, (r) {
        context.goNamed("Home");
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Join Facebook",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Finish signing up",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "People who use our service may have uploaded your contact information to Facebook. Learn more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 75, 75, 75),
                    fontSize: 17,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "By tapping Sign Up,you agree to our Terms Privacy Policy and Cokkies Policy. You may",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 75, 75, 75),
                    fontSize: 17,
                  ),
                ),
              ),
              const Text(
                " receive SMS notifications from us and can opt out any time.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyDefaultButton(
                buttonColor: MyColors.primaryColor,
                textColor: Colors.white,
                width: double.infinity,
                text: "Sign Up",
                onClicked: createUserWithEmailAndPassowrd,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
