import 'dart:convert';

class ChatMessageEntity {
  String text;
  String? imageUrl;
  String id;
  int createAt;
  Author author;

  ChatMessageEntity(
      {required this.text,
      required this.id,
      required this.createAt,
      this.imageUrl,
      required this.author});

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        text: json['text'],
        id: json['id'],
        createAt: json['createdAt'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String userName;

  Author({required this.userName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['username']);
  }
}
