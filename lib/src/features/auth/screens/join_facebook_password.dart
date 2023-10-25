import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/text_input.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/authentication_service.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/providers.dart';

class JoinFacebookSeventh extends ConsumerWidget {
  const JoinFacebookSeventh({
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
      const email = "younes123@gmail.com";
      final password = ref.read(passwordProvider);

      final result =
          await validationService.validateAndCreateUser(email, password);

      result.fold(
        (l) {
          ref.read(showErrorMessageProvider.notifier).update((state) => true);
          ref.read(errorMessageProvider.notifier).update((state) => l.message);
        },
        (r) {
          ref.read(showErrorMessageProvider.notifier).update((state) => false);
          context.goNamed("Gender");
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
                "Create a password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Create a password with at least 6 characters. It should be somthing others couldn't guess.",
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
                  onTap: () {},
                  obscureText: false,
                  readOnly: false,
                  controller: TextEditingController(),
                  visible: false,
                  warningText: "",
                  width: 179,
                  text: "New Password",
                  onChanged: (String newText) {
                    ref
                        .watch(passwordProvider.notifier)
                        .update((state) => newText);
                  },
                ),
              ),
              Visibility(
                visible: visible, //! HERE
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
                      fontSize: 17,
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
                onClicked: () {
                  validate();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Spacer(
                flex: 15,
              ),
              MyDefaultButton(
                onClicked: () {},
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
