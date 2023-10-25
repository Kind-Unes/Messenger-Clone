import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger_clone_app/src/common/presentation/constants/theme.dart';
import 'package:messenger_clone_app/src/common/presentation/widgets/my_buttons.dart';

// TODO : Make the accounts Container dynamic by creating listview.builder + passing the data

class MainAutth extends StatelessWidget {
  const MainAutth({super.key});

  @override
  Widget build(BuildContext context) {
    double sizedBoxHeight = 3;
    return Scaffold(
      backgroundColor: const Color.fromARGB(228, 250, 247, 247),
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: MyColors.primaryColor,
        title: const Text("Facebook Lite"),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.info_outline_rounded,
            color: Color.fromARGB(255, 241, 238, 238),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "  Tap your profile picture to log in",
            style: TextStyle(color: Color.fromARGB(189, 0, 0, 0), fontSize: 19),
          ),
          const SizedBox(
            height: 10,
          ),
          const LogInTile(),
          SizedBox(
            height: sizedBoxHeight,
          ),
          const LogInTile(),
          SizedBox(
            height: sizedBoxHeight,
          ),
          const LogInTile(),
          SizedBox(
            height: sizedBoxHeight,
          ),
          const LogInTile(),
          SizedBox(
            height: sizedBoxHeight,
          ),
          const SizedBox(
            height: 20,
          ),
          LoginMethodTile(
            onTap: () {
              context.goNamed("LogIn");
            },
            icon: Icons.add,
            text: 'Log Into Another Account',
          ),
          const SizedBox(
            height: 25,
          ),
          LoginMethodTile(
            onTap: () {
              context.goNamed("FindMyAccount");
            },
            icon: Icons.search,
            text: 'Find Your Accounts',
          ),
          const SizedBox(
            height: 35,
          ),
          MyDefaultButton(
              buttonColor: const Color.fromARGB(255, 21, 142, 25),
              textColor: Colors.white,
              width: double.infinity,
              text: "Create new account",
              onClicked: () {
                context.goNamed("Introduction");
              })
        ],
      )),
    );
  }
}

class LoginMethodTile extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final String text;
  const LoginMethodTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(217, 14, 81, 227)),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              text,
              style: const TextStyle(
                  color: Color.fromARGB(217, 14, 81, 227), fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class LogInTile extends StatelessWidget {
  const LogInTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 90,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Row(children: [
                Container(
                  height: 65,
                  width: 65,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 181, 41, 41)),
                  child: const Image(
                      image: AssetImage("assets/images/download.jpg")),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Younes Hellalet",
                        style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(189, 0, 0, 0),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {},
                )
              ]),
              Positioned(
                  left: 55,
                  bottom: 50,
                  child: Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: const Color.fromARGB(255, 213, 19, 19)),
                    child: const Text(
                      "1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
