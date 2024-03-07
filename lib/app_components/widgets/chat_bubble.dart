import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: isSender ? Colors.purple : Colors.blueGrey.shade300,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.symmetric(vertical: 2.8, horizontal: 36),
      child: Text(
        message,
        style: TextStyle(color: Colors.white30),
      ),
    );
  }
}
