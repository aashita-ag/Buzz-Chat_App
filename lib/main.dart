import 'package:buzz/contact_list_screen.dart';
import 'package:buzz/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:buzz/registration_screen.dart';
import 'package:buzz/contact_list_screen.dart';

import 'homepage.dart';
void main() {
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


