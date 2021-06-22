import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactListScreen extends StatefulWidget {
  static String id = 'contact_list_screen';
  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEAE0),
      appBar: AppBar(
        backgroundColor: Color(0xFF2F5061),
        title: Center(
          child: Image.asset(
            'images/appbarlogo.png',
            height: 50,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                //searchbar
              ),
              Expanded(
                child: ListView(
                  children: [
                    ContactItem(),
                    ContactItem(),
                    ContactItem(),
                    ContactItem(),
                    ContactItem(),
                    ContactItem(),
                    ContactItem(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.account_circle,
                color: Colors.cyan,
                size: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Devu',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Icon(
                Icons.phone,
                color: Color(0xFF4297A0),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Divider(
            color: Colors.blueGrey,
            indent: 15,
            endIndent: 15,
          )
        ],
      ),
    );
  }
}
