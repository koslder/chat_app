import 'dart:convert';
import 'package:chat_app/models/image_model.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  Future<List<PixelfordImage>> _getNetworkImages() async {
    var endpointUrl = Uri.parse('https://picsum.photos/v2/list');

    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      final List<dynamic> decodeList = jsonDecode(response.body) as List;

      final List<PixelfordImage> _imageList = decodeList.map((listItem) {
        return PixelfordImage.fromJson(listItem);
      }).toList();

      print(_imageList[0].urlFullSize);
      return _imageList;
    } else {
      throw Exception('Api not succesful!');
    }
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _getNetworkImages();
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
          FutureBuilder<List<PixelfordImage>>(
              future: _getNetworkImages(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PixelfordImage>> snapshot) {
                if (snapshot.hasData)
                  return Image.network(snapshot.data![0].urlSmallSize);

                return CircularProgressIndicator();
              }),
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _messages[index].author.userName == 'poojab26'
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
