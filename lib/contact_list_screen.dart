import 'package:buzz/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          padding: EdgeInsets.all(8),
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
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Color(0xB2A3C2BF),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.only(bottom: 8,top: 3),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, ChatScreen.id);
                  },
                  icon: Icon(FontAwesomeIcons.userCircle),
                  color: Colors.cyan,
                  iconSize: 50,
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed:(){
                      Navigator.pushNamed(context, ChatScreen.id);
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Devu',
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Color(0xFF2B7C85),
                  indent: 5,
                  thickness: 1,
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xFF4297A0),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
