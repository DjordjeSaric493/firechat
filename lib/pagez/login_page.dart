import 'package:firechat/services/auth/auth_user_service.dart';
import 'package:firechat/app_components/widgets/custom_button.dart';
import 'package:firechat/app_components/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email & psw controllrs

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

//tap to register page
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  //logIn method
  void logIn(BuildContext context) async {
    //firebase auth service
    final authService = AuthService();

    try {
      await authService.signInWEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TODO:Insert logo here:
              Icon(
                Icons.message_rounded,
                size: 69,
                color: Theme.of(context).colorScheme.primary,
              ),
              //TODO:insert welcome message
              Text(
                "Welcome, you'll regret this",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 25),
              //TODO: insert email textField
              MyCustomTextField(
                hintText: "Type your email here, stupid",
                obscureText: false, //want to show mail
                controller: _emailController,
              ),
              const SizedBox(height: 25),
              //TODO:password textfield
              MyCustomTextField(
                hintText: "Type your password here 🤡 ",
                obscureText: true, //won't show psw
                controller: _passwordController,
              ),
              const SizedBox(height: 25),
              //TODO:login button
              MyCustomButton(
                text: "Log In",
                onTap: () => logIn(context),
              ),
              //TODO: register buttom
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not our user?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      " Register now!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
