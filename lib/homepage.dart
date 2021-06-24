import 'package:buzz/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login_screen.dart';

class Homepage extends StatefulWidget {
  static String id = 'homepage';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(

        children: [
          Image.asset('images/Messages-pana.png'),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'name',
                child: Text(
                  'BUZZ',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'ConcertOne',
                    color:Color(0xff455A64),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Expanded(
              child: Text(
                'In the tumultuous business of cutting-in and attending to a whale, there is.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey,
                fontSize: 14,),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Material(
              elevation:5.0,
              color: Color(0xff92E3A9),
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  child: Text(
                    'Get started',
                    style: TextStyle(fontSize: 20.0, color: Colors.black54,
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0, color: Color(0xff455A64)),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
