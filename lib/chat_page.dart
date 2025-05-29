import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);

  List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      author: Author(userName: 'pooja'),
      createAt: 21212121,
      id: '1',
      text: 'first text',
      imageUrl: 'assets/illusatration.png',
    ),
    ChatMessageEntity(
      author: Author(userName: 'pooja'),
      createAt: 21212121,
      id: '1',
      text: 'second text',
      imageUrl: 'assets/illusatration.png',
    ),
    ChatMessageEntity(
      author: Author(userName: 'jane'),
      createAt: 21212121,
      id: '1',
      text: 'third text',
      imageUrl: 'assets/illusatration.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
              print('Icon Pressed!');
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _messages[index].author.userName == 'pooja'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index]);
                }),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
