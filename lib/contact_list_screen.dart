import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  static String id = 'contact_list_screen';
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ImageIcon(
          AssetImage('images/logo.png'),
          size: 20,
        ),
        title: Text(
          'Buzz',
          style: TextStyle(
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(

            ),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.cyan,
                      ),
                      Expanded(
                        child: Text(
                          'Raj',
                        ),
                      ),
                      Icon(
                        Icons.phone,
                        color: Colors.lightGreenAccent,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.blueGrey,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
