import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Color(0xff92E3A9),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  //contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
filled: true,
  fillColor: Color(0xff455A64),
  hintText: 'Type your message',
  hintStyle: TextStyle(color: Colors.white),
);

const kMessageContainerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border(
    top: BorderSide(color: Colors.white, width: 2.0),
  ),
);
const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff92E3A9), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff92E3A9), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
