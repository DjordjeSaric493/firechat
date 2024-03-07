import 'package:firechat/app_components/widgets/app_user_tile.dart';
import 'package:firechat/app_components/widgets/custom_drawer.dart';
import 'package:firechat/pagez/chat_page.dart';
import 'package:firechat/services/auth/auth_user_service.dart';
import 'package:firechat/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

//auth and chat services
  final AuthService _authService = AuthService();
  final ChatAppService _chatAppService = ChatAppService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
      ),
      //drawer on the top left
      drawer: const MyCustomDrawer(),
      body: _buildAppUserList(),
    );
  }

  //build a list of app users except for the current logged user
  Widget _buildAppUserList() {
    return StreamBuilder(
      stream: _chatAppService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("ERROR");
        }
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading **");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>(
                  (userData) => _buildAppUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildAppUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users xcept our current
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          //go to chats page when you tap on user
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
