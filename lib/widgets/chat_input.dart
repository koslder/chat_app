import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final chatMessengerController = TextEditingController();

  void onSendButtonPressed() {
    print('Chat Message: ${chatMessengerController.text}');

    final newChatMessage = ChatMessageEntity(
        text: chatMessengerController.text,
        id: "224",
        createAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(userName: 'poojab26'));

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              controller: chatMessengerController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onSendButtonPressed,
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
