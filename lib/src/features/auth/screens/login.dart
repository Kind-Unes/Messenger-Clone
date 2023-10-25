import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/text_input.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/authentication_service.dart';
import 'package:messenger_clone_app/src/features/auth/controllers/providers.dart';

class LogIn extends ConsumerWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bool visible = ref.watch(showErrorMessageProvider);
    final String message = ref.watch(errorMessageProvider);
    Future<void> signInWithEmailAndPassword() async {
      final auth = ref.read(authServiceProvider);
      final email = ref.read(loginEmailProvider);
      final password = ref.read(loginPasswordProvider);
      final result = await auth.signInWithEmailAndPassword(email, password);
      result.fold((l) {
        debugPrint(
            "Faiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiip");

        ref.read(errorMessageProvider.notifier).update((state) => l.message);
        ref.read(showErrorMessageProvider.notifier).update((state) => true);
      }, (r) {
        debugPrint(
            "successssssssssssssssssssssssssssssssssssssssssssssssssssuiiiii");
        context.goNamed("Home");
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Facebook",
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          toolbarHeight: 40,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTextInput(
                  width: double.infinity,
                  text: "Mobile number or email",
                  onChanged: (String newText) {
                    ref
                        .watch(loginEmailProvider.notifier)
                        .update((state) => newText);
                  },
                  warningText: "",
                  visible: false,
                  controller: TextEditingController(),
                  onTap: () {},
                  readOnly: false,
                  obscureText: false),
              const SizedBox(
                height: 10,
              ),
              MyTextInput(
                  width: double.infinity,
                  text: "Password",
                  onChanged: (String newText) {
                    ref
                        .watch(loginPasswordProvider.notifier)
                        .update((state) => newText);
                  },
                  warningText: "",
                  visible: false,
                  controller: TextEditingController(),
                  onTap: () {},
                  readOnly: false,
                  obscureText: true),
              const SizedBox(
                height: 5,
              ),
              MyDefaultButton(
                  buttonColor: const Color.fromARGB(220, 14, 92, 227),
                  textColor: Colors.white,
                  width: double.infinity,
                  text: "Log in",
                  onClicked: () {
                    signInWithEmailAndPassword();
                  }),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: visible,
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                height: 30,
              ),
              LinkText(
                text: "Forgot password?",
                onTap: () {},
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyDivider(
                    height: 1,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "or",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MyDivider(
                    height: 1,
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: MyDefaultButton(
                    buttonColor: MyColors.activeStatus,
                    textColor: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.5,
                    text: "Create new account",
                    onClicked: () {}),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinkText(onTap: () {}, text: "Francais (France)"),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkText(onTap: () {}, text: "العربية"),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkText(onTap: () {}, text: "English (US)"),
                    const SizedBox(
                      height: 20,
                    ),
                    LinkText(onTap: () {}, text: "More Languages . . . "),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
        ));
  }
}

class MyDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double width;
  const MyDivider({
    super.key,
    required this.height,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: color),
    );
  }
}

class LinkText extends StatelessWidget {
  final Function() onTap;
  final String text;
  const LinkText({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
            color: Color.fromARGB(255, 33, 103, 243), fontSize: 19),
      ),
    );
  }
}
