import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter_stateful_demo.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Chat App",
        theme: ThemeData(primarySwatch: Colors.yellow),
        home: const CounterStateful());
  }
}
