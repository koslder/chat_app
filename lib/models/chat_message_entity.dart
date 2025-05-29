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
}

class Author {
  String userName;

  Author({required this.userName});
}
