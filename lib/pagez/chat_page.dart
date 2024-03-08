import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechat/app_components/widgets/chat_bubble.dart';
import 'package:firechat/app_components/widgets/custom_textfield.dart';
import 'package:firechat/services/auth/auth_user_service.dart';
import 'package:firechat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  //text message controller
  final TextEditingController _msgController = TextEditingController();

  //auth and chat services
  final AuthService _authService = AuthService();
  final ChatAppService _chatAppService = ChatAppService();

  //async method sendMessage
  void sendMessage() async {
    //if theres text in textfield->using msgcontroller
    if (_msgController.text.isNotEmpty) {
      //send that f  message
      await _chatAppService.sendMessage(receiverID, _msgController.text);

      //clear our msg text controlller
      _msgController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          //display all messages
          Expanded(
            child: _buildMsgList(),
          ),
          //user input
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMsgList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatAppService.getUserMessages(receiverID, senderID),
      builder: (context, snapshot) {
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        //errror handling
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //return list view
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isSender = data['senderID'] == _authService.getCurrentUser()!.uid;

    //align message to the right if sender is current user, left if recieves
    var alignment = isSender
        ? Alignment.centerRight
        : Alignment.centerLeft; //yASS , ternary operators gotta love em...

    return Container(
      alignment: alignment, //used this smart alignment left/right

      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [ChatBubble(message: data["message"], isSender: isSender)],
      ),
    );
  }

  //user input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 45.0),
      child: Row(
        children: [
          Expanded(
            child: MyCustomTextField(
              controller: _msgController,
              hintText: "Type a message here",
              obscureText: false,
            ),
          ),
          //sendmessage buttOn
          Container(
            decoration: const BoxDecoration(
              color: Colors.purpleAccent,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right: 30),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.arrow_upward_rounded, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
