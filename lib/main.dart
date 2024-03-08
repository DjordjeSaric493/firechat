import 'package:firebase_core/firebase_core.dart';
import 'package:firechat/services/auth/auth_user_gate.dart';
import 'package:firechat/firebase_options.dart';
import 'package:firechat/theme/light_mode.dart';
import 'package:firechat/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //logic we still don't know if user is logged
      home: AuthUserGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
