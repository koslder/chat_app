import 'package:flutter/material.dart'; // Changed from widgets.dart to material.dart

class ChatBubble extends StatelessWidget {
  final String message;
  final Alignment alignment;
  const ChatBubble({Key? key, required this.alignment, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Image.network(
              'https://3809789.youcanlearnit.net/Alien_LIL131358.png',
              height: 200,
            )
          ],
        ),
        margin: const EdgeInsets.all(50),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
