import 'package:buzz/contact_list_screen.dart';
import 'package:buzz/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:buzz/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';



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
      routes: {
        ContactListScreen.id:(context)=>ContactListScreen(),
        Homepage.id: (context) =>Homepage(),
        LoginScreen.id:(context)=>LoginScreen(),
        RegistrationScreen.id : (context)=>RegistrationScreen(),
        ContactListScreen.id : (context)=>ContactListScreen(),
      },
    );
  }
}


