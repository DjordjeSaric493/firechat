import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const MyCustomTextField({
    super.key,
    required this.hintText, //requires hint text
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    //it's a custom textfield obv
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.2),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary),
            ),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            //hint text is different for mail and password (4 example idk)
            hintText: hintText, //check out final String hintText
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}
