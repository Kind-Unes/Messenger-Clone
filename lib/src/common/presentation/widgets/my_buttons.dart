import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MyDefaultButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final double width;
  final String text;
  final Function() onClicked;
  const MyDefaultButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.width,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      borderRadius: BorderRadius.circular(3),
      child: Ink(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  const MyIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(400),
      onTap: onTap,
      child: Container(
          width: 45,
          height: 45,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(400),
              color: const Color.fromARGB(97, 158, 158, 158)),
          child: Center(
            child: FaIcon(
              icon,
              color: Colors.black,
            ),
          )),
    );
  }
}

class MySmallButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const MySmallButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
      ),
    );
  }
}

class GoBackButton extends StatelessWidget {
  final String path;
  final double size;
  final Color color;
  const GoBackButton(
      {super.key, required this.path, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.go(path);
      },
      icon: const Icon(Icons.arrow_back),
      iconSize: size,
      color: color,
    );
  }
}
