import 'package:firechat/app_components/widgets/custom_button.dart';
import 'package:firechat/app_components/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
//
//tap to login page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  //register method
  void register() {}

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
                Icons.messenger_sharp,
                size: 69,
                color: Theme.of(context).colorScheme.primary,
              ),
              //TODO:insert welcome message
              Text(
                "Let's make your user account",
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
              //TODO:confirmpassword textfield
              MyCustomTextField(
                hintText: "Confirm your password 😁 ",
                obscureText: true, //won't show psw
                controller: _confirmController,
              ),
              //TODO:register button
              MyCustomButton(
                text: "Register",
                onTap: register,
              ),
              //TODO: register buttom
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      " Login now!",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
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

class _passwordController {}
