import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/providers.dart';

class JoinFacebookSixth extends ConsumerWidget {
  const JoinFacebookSixth({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGender = ref.watch(genderProvider);
    void validate() {
      if (selectedGender.trim().isEmpty) {
        ref
            .read(errorMessageProvider.notifier)
            .update((state) => "Please select a gender.");
        ref.read(showErrorMessageProvider.notifier).update((state) => true);
      } else {
        context.goNamed("Finish");
      }
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
                "What's your gender?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "You change who sees your gneder on your profile later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 75, 75, 75),
                  fontSize: 17,
                ),
              ),
              RadioListTile<String>(
                title: const Text(
                  'Male',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                value: "Male",
                groupValue: selectedGender,
                onChanged: (value) {
                  ref.watch(genderProvider.notifier).update((state) => value!);
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, // Align to the right
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              RadioListTile<String>(
                title: const Text(
                  'Female',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                value: "Female",
                groupValue: selectedGender,
                onChanged: (value) {
                  ref.watch(genderProvider.notifier).update((state) => value!);
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, // Align to the right
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              RadioListTile<String>(
                subtitle: const Text(
                  "Select this if you are a GAY, or if you'd rather not to say.",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                title: const Text(
                  'Gay',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                value: "Custom",
                groupValue: selectedGender,
                onChanged: (value) {
                  ref.watch(genderProvider.notifier).update((state) => value!);
                },
                controlAffinity:
                    ListTileControlAffinity.trailing, // Align to the right
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              MyDefaultButton(
                buttonColor: MyColors.primaryColor,
                textColor: Colors.white,
                width: double.infinity,
                text: "Next",
                onClicked: validate,
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
