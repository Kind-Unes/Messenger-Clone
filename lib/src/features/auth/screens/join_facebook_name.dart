import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/text_input.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/providers.dart';

class JoinFacebookSecond extends ConsumerWidget {
  const JoinFacebookSecond({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // intialize providers
    void validateInputs() {
      final firstName = ref.watch(firstNameProvider);
      final lastName = ref.watch(lastNameProvider);

      if (firstName.isEmpty && lastName.isEmpty) {
        //show both error Messages
        ref
            .read(showFirstNameErrorMessageProvider.notifier)
            .update((state) => false);

        ref
            .read(showLastNameErrorMessageProvider.notifier)
            .update((state) => false);

        ref.read(showErrorMessageProvider.notifier).update((state) => true);
      } else {
        //show only the needed error ones

        ref.read(showErrorMessageProvider.notifier).update((state) => false);

        if (firstName.isEmpty) {
          ref
              .read(showFirstNameErrorMessageProvider.notifier)
              .update((state) => true);
        } else {
          ref
              .read(showFirstNameErrorMessageProvider.notifier)
              .update((state) => false);
        }

        if (lastName.isEmpty) {
          ref
              .read(showLastNameErrorMessageProvider.notifier)
              .update((state) => true);
        } else {
          ref
              .read(showLastNameErrorMessageProvider.notifier)
              .update((state) => false);
        }

        if (firstName.isNotEmpty && lastName.isNotEmpty) {
          context.goNamed("Email");
        }
      }
    }

    // visible ?
    final bool showLastName = ref.watch(showLastNameErrorMessageProvider);
    final bool showFirstName = ref.watch(showFirstNameErrorMessageProvider);
    final bool showBoth = ref.watch(showErrorMessageProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          title: const Text(
            "Join Facebook",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Center(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "What's your name?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter the name you use in real life.",
              style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75), fontSize: 18),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextInput(
                      obscureText: false,
                      onTap: () {},
                      readOnly: false,
                      controller: TextEditingController(),
                      visible: showFirstName, //! HERE
                      warningText: "Please enter your first name",
                      width: 179,
                      text: "First name",
                      onChanged: (String newText) {
                        ref
                            .read(firstNameProvider.notifier)
                            .update(((state) => newText));
                      },
                    ),
                    MyTextInput(
                      obscureText: false,
                      onTap: () {},
                      readOnly: false,
                      controller: TextEditingController(),
                      visible: showLastName, //! HERE
                      warningText: "Please enter your last name",
                      width: 179,
                      text: "Last name",
                      onChanged: (String newText) {
                        ref
                            .read(lastNameProvider.notifier)
                            .update(((state) => newText));
                      },
                    ),
                  ]),
            ),
            Visibility(
              visible: showBoth, //! HERE  + COPY PASTE ME
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                decoration: const BoxDecoration(color: Colors.red),
                child: const Text(
                  "Please enter your first and last name.",
                  style: TextStyle(
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
                onClicked: validateInputs),
            const Spacer(
              flex: 15,
            ),
            MyDefaultButton(
                onClicked: () {},
                buttonColor: Colors.white,
                textColor: MyColors.primaryColor,
                width: double.infinity,
                text: "Already have an account?"),
            const Spacer(
              flex: 1,
            ),
          ]),
        ),
      ),
    );
  }
}
