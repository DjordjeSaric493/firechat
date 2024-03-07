import 'package:firechat/pagez/login_page.dart';
import 'package:firechat/pagez/register_page.dart';
import 'package:flutter/material.dart';

//this is stateful because it depends whether our
//will be logged or registered
class LogOrReg extends StatefulWidget {
  const LogOrReg({super.key});

  @override
  State<LogOrReg> createState() => _LogOrRegState();
}

class _LogOrRegState extends State<LogOrReg> {
  //first, it will show login page
  //user will register once but will log as much as he/she/it/whatever wants to use app
  bool showUserLoginPage = true;

  //create switch between login and register
  void switchPages() {
    setState(() {
      showUserLoginPage = !showUserLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    //is the statement is true->show login
    if (showUserLoginPage) {
      return LoginPage(
        onTap: switchPages,
      );
    } else {
      //show register page
      return RegisterPage(
        onTap: switchPages,
      );
    }
  }
}
