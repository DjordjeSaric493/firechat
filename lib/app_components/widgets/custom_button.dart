import 'package:flutter/material.dart';

//widget we will recycle for login and register
class MyCustomButton extends StatelessWidget {
  //for now difference is in text (login/register),
  // that's why it's mandatory to declare  when you call this class

  final String text;
  final void Function()? onTap;
  const MyCustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          //text is not const because we will use another text for register page
          child: Text(text),
        ),
      ),
    );
  }
}
