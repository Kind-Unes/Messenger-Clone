import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final double width;
  final String warningText;
  final String text;
  final Function(String) onChanged;
  final bool visible;
  final TextEditingController controller;
  final Function() onTap;
  final bool readOnly;
  final bool obscureText;
  const MyTextInput({
    super.key,
    required this.width,
    required this.text,
    required this.onChanged,
    required this.warningText,
    required this.visible,
    required this.controller,
    required this.onTap,
    required this.readOnly,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.left,
          ),
          Transform.scale(
            scaleY: 0.8,
            child: TextField(
              obscureText: obscureText,
              obscuringCharacter: "*",
              readOnly: readOnly,
              onTap: onTap,
              onChanged: onChanged,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: visible ? Colors.red : Colors.grey),
                  borderRadius: BorderRadius.circular(0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: visible ? Colors.red : Colors.grey),
                  borderRadius: BorderRadius.circular(0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: visible ? Colors.red : Colors.grey),
                  borderRadius: BorderRadius.circular(0),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 5,
                ),
              ),
              cursorColor: Colors.grey,
              cursorHeight: 30,
              style: const TextStyle(fontSize: 20, color: Colors.black),
              maxLines: 1,
            ),
          ),
          Visibility(
            visible: visible,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              decoration: const BoxDecoration(color: Colors.red),
              child: Text(
                warningText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
