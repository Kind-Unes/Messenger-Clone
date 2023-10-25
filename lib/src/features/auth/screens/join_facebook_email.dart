import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/text_input.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/authentication_service.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/providers.dart';

class JoinFacebookThird extends ConsumerWidget {
  const JoinFacebookThird({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //variables
    final message = ref.watch(errorMessageProvider);
    final visible = ref.watch(showErrorMessageProvider);
    //methods
    Future<void> validate() async {
      final validationService = ref.read(authServiceProvider);
      final email = ref.read(emailProvider);
      const password = "yoNeS123NES";

      final result =
          await validationService.validateAndCreateUser(email, password);

      result.fold(
        (l) {
          ref.read(showErrorMessageProvider.notifier).update((state) => true);
          ref.read(errorMessageProvider.notifier).update((state) => l.message);
        },
        (r) {
          ref.read(showErrorMessageProvider.notifier).update((state) => false);
          context.goNamed("Password");
        },
      );
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
                "Enter your email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter the email where you can be reached. You can hide this from your profile later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 17,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: MyTextInput(
                  obscureText: false,
                  onTap: () {},
                  readOnly: false,
                  controller: TextEditingController(),
                  visible: false,
                  warningText: "",
                  width: 179,
                  text: "Email address",
                  onChanged: (String newText) {
                    ref
                        .watch(emailProvider.notifier)
                        .update((state) => newText);
                  },
                ),
              ),
              Visibility(
                visible: visible,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 5,
                  ),
                  decoration: const BoxDecoration(color: Colors.red),
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MyDefaultButton(
                  buttonColor: MyColors.primaryColor,
                  textColor: Colors.white,
                  width: double.infinity,
                  text: "Next",
                  onClicked: validate),
              const SizedBox(
                height: 10,
              ),
              MyDefaultButton(
                onClicked: () {
                  context.replaceNamed("Mobile");
                },
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Sign up with phone number",
              ),
              const Spacer(
                flex: 15,
              ),
              MyDefaultButton(
                onClicked: () {
                  context.goNamed("LogIn");
                },
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Already have an account?",
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
