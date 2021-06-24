import 'package:buzz/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:buzz/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'chat_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Buzz());
}
class Buzz extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Homepage.id,
      debugShowCheckedModeBanner: false,
      routes: {
        ChatScreen.id:(context)=>ChatScreen(),
        Homepage.id: (context) =>Homepage(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id : (context)=>RegistrationScreen()
      },
    );
  }
}
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var email = prefs.getString('email');
//   runApp(MaterialApp(
//     initialRoute: email == null ? Homepage.id : ChatScreen.id,
//     routes: {
//       ChatScreen.id: (context) => ChatScreen(),
//       Homepage.id: (context) => Homepage(),
//       LoginScreen.id: (context) => LoginScreen(),
//       RegistrationScreen.id: (context) => RegistrationScreen()
//     },
//   ));
// }
