import 'package:firechat/services/auth/auth_user_service.dart';
import 'package:firechat/pagez/settings_page.dart';
import 'package:flutter/material.dart';

class MyCustomDrawer extends StatelessWidget {
  const MyCustomDrawer({super.key});

  void logout() {
    //get userAuth service

    final _authUserService = AuthService();
    _authUserService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message_sharp,
                    color: Theme.of(context).colorScheme.primary,
                    size: 43,
                  ),
                ),
              ),
              //home List tile
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: ListTile(
                  title: const Text("HOME"),
                  leading: const Icon(Icons.home_filled),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: ListTile(
                  title: const Text("SETTINGS"),
                  leading: const Icon(Icons.settings_applications_outlined),
                  onTap: () {
                    Navigator.pop(context);

                    //navigate to settings
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MySettingsPage(),
                      ),
                    );
                  },
                ),
              ),
              //logoutlist tile
              Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 30),
                child: ListTile(
                  title: const Text("Log out"),
                  leading: const Icon(Icons.logout_sharp),
                  onTap: logout,
                ),
              ),
            ],
          ),
          //logo
        ],
      ),
    );
  }
}
