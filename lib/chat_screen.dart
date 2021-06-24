import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final messageTextController = TextEditingController();
  late String textmessage;

  @override
  void initState() {
    super.initState();
    getCurUser();
  }

  void getCurUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Image.asset('images/appbarlogo.png',
          height: 50,),
        backgroundColor: Color(0xff455A64),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              height: 55,
              decoration: kMessageContainerDecoration,
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white,
                      ),

                      controller: messageTextController,
                      onChanged: (value) {
                        textmessage = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                        filled: true,
                        fillColor: Color(0xff455A64),
                        hintText: 'Type your message',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      )
                    ),
                  ),

                  ElevatedButton(
                      onPressed: () {
                        messageTextController.clear();
                        _firestore.collection('messages').add({
                          'text': textmessage,
                          'sender': loggedInUser.email,
                          'time': DateTime.now(),
                        });
                      },

                    child: Icon(Icons.send),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff92E3A9),
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                    ),
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

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff455A61),
            ),
          );
        }
        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> messageWidgets = [];
        for (var mess in messages) {
          final messText = mess.data()['text'];
          final messSender = mess.data()['sender'];
          final messTime = mess.data()['time'];
          final currentUser = loggedInUser.email;

          final messageWidget = MessageBubble(
              text: messText,
              sender: messSender,
              isMe: currentUser == messSender,
              time:messTime,
          );
          messageWidgets.add(messageWidget);
          messageWidgets.sort((a ,b)=>b.time.compareTo(a.time));
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.text, required this.sender, required this.isMe,required this.time});
  final String text, sender;
  final bool isMe;
  final Timestamp time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            "$sender",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 10,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))
                : BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(5)),
            elevation: 5.0,
            color: isMe ?  Color(0xff455A61) : Color(0xff92E3A9),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: isMe ? Colors.white : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
