import 'package:firechat/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  const ChatBubble({
    super.key,
    required this.message,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled =
        Provider.of<ThemeProvider>(context, listen: false).isDarkModeEnabled;
    return Container(
      decoration: BoxDecoration(
        //change text speech bubbles according to selected theme
        color: isSender
            ? (isDarkModeEnabled
                ? Colors.purple
                : const Color.fromARGB(255, 52, 239, 64))
            : (isDarkModeEnabled
                ? Colors.blue.shade800
                : Color.fromARGB(255, 232, 237, 90)),
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.symmetric(vertical: 2.8, horizontal: 36),
      child: Text(
        message,
        //change text to adapt theme
        style: TextStyle(color: isSender ? Colors.white : Colors.black26),
      ),
    );
  }
}
