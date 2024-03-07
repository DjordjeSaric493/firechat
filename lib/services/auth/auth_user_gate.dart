import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechat/services/auth/lor_or_reg.dart';
import 'package:firechat/pagez/home_page.dart';
import 'package:flutter/material.dart';

/*
--- AUTH GATE ---
widget or a screen that serves as the entry point for
 users to log in or authenticate themselves. 
 Once the user provides valid credentials 
 (such as a username and password), they are 
 granted access to the rest of the application.

just type auth gate on chatgpt or copy my code and voila, 
no need to explain much ljubibraat
 */
class AuthUserGate extends StatelessWidget {
  const AuthUserGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in -> go to home page
            if (snapshot.hasData) {
              return HomePage();
            }
            //!logged -->redirect on  log in or sign in pages
            else {
              return const LogOrReg();
            }
          }),
    );
  }
}
