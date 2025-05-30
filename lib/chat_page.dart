import 'dart:convert';
import 'package:chat_app/repo/image_repository.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      author: Author(userName: 'pooja'),
      createAt: 21212121,
      id: '1',
      text: 'first text',
      imageUrl: 'assets/illustration.png',
    ),
    ChatMessageEntity(
      author: Author(userName: 'pooja'),
      createAt: 21212121,
      id: '1',
      text: 'second text',
      imageUrl: 'assets/illustration.png',
    ),
    ChatMessageEntity(
      author: Author(userName: 'jane'),
      createAt: 21212121,
      id: '1',
      text: 'third text',
      imageUrl: 'assets/illustration.png',
    ),
  ];

  _loadInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodeList = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodeList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(_chatMessages.length);

      setState(() {
        _messages = _chatMessages;
      });
    }).then((_) {
      print('done');
    });
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  final ImageRepository _imageRepo = ImageRepository();

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = context.watch<AuthService>().getUserName();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().logoutUser();
              // Navigate to login screen
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
            icon: Icon(Icons.logout), // Consider using a logout icon
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _messages[index].author.userName ==
                              AuthService().getUserName()
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index]);
                }),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
