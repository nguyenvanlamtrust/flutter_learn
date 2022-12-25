import 'package:nguyenvanlam/utils/const_images.dart';

class ChatModel {
  final String avatar;
  final String name;
  final String chat;
  final List<Message> messages;

  ChatModel({required this.avatar, required this.name, required this.chat, required this.messages});
}

class Message {
  final bool isSentByMe;
  final String content;

  Message({
    required this.isSentByMe,
    required this.content
  });
}

final listChat = [
  ChatModel(avatar: Images.man, name: 'Father', chat: 'What are you doing?', messages: [
    Message(isSentByMe: false, content: 'Con dang lam gi day!aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
    Message(isSentByMe: true, content: 'test.'),
    Message(isSentByMe: false, content: 'test'),
  ]),
  ChatModel(avatar: Images.woman, name: 'Mother', chat: 'What are you doing?', messages: [
    Message(isSentByMe: false, content: 'test test'),
    Message(isSentByMe: true, content: 'test test'),
  ]),
  ChatModel(avatar: Images.woman, name: 'Sister', chat: 'What are you doing?', messages: [
    Message(isSentByMe: false, content: 'test test'),
    Message(isSentByMe: true, content: 'test test.'),
  ]),
  ChatModel(avatar: Images.woman, name: 'Wife', chat: 'What are you doing?', messages: [
    Message(isSentByMe: false, content: 'test test'),
    Message(isSentByMe: true, content: 'test test'),
  ]),
  ChatModel(avatar: Images.animal, name: 'Unknow', chat: 'What are you doing?', messages: [
    Message(isSentByMe: false, content: 'Ban dang lam gi day'),
    Message(isSentByMe: true, content: 'Ban la ai vay?'),
  ]),
];
