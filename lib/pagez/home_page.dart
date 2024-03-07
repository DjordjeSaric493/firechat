import 'package:firechat/app_components/auth/auth_user_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    //get userAuth service

    final _authUserService = AuthService();
    _authUserService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
