import 'package:firebase_core/firebase_core.dart';
import 'package:firechat/firebase_options.dart';
import 'package:firechat/theme/light_mode.dart';
import 'package:flutter/material.dart';

//instead of separate imports for login and register
import 'package:firechat/app_components/auth/lor_or_reg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //logic we still don't know if user is logged
      home: LogOrReg(),
      theme: lightMode,
    );
  }
}
