import 'package:flutter/material.dart';
import 'package:nguyenvanlam/model/chat_model.dart';
import 'package:nguyenvanlam/utils/const_images.dart';
import 'package:nguyenvanlam/utils/helper.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    
    final ChatModel chat = ModalRoute.of(context)?.settings.arguments as ChatModel;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Flexible(
                flex: 7,
                child: Row(
                  children: [
                    Helper.buildCircleAvatar(avatar: chat.avatar, transparentColor: true),
                    const SizedBox(width: 10,),
                    Text(chat.name),
                  ]
                )
              ),
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end , 
                  children: [
                    GestureDetector(child: const Icon(Icons.call_sharp), onTap: () {}),
                    const SizedBox(width: 10,),
                    GestureDetector(child: const Icon(Icons.video_call_sharp), onTap: () {}),
                  ]
                )
              ),
            ],
          ),
        ),
        body: _buildBody(chat));
  }

  Widget _buildBody(chat) {
    if (chat.messages.isEmpty) {
      return const Center(child: Text('No history chat.'));
    }
    return _buildListMessages(chat: chat);
  }

  Widget _buildListMessages({required ChatModel chat}) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return _buildMessageItem(index: index, chat: chat);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: chat.messages.length),
          ),
          Row(
            children: [
              Flexible(flex: 4, child: _buildBottomLeftIcons()),
              Flexible(
                flex: 5,
                child: _buildSendMessageInput(),
              ),
              Flexible(
                flex: 1,
                child: _buildBottomRightIcons(),
              )
            ],
          ),
        ],
      ),
    );
  }

  Icon _buildBottomRightIcons() => _buildIcon(Icons.thumb_up);

  Row _buildBottomLeftIcons() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _buildIcon(Icons.send_sharp),
      _buildIcon(Icons.local_see),
      _buildIcon(Icons.image),
      _buildIcon(Icons.mic),
    ]);
  }

  Container _buildSendMessageInput() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xffefefef),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Aa',
          suffixIcon: _buildIcon(Icons.emoji_emotions_sharp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Icon _buildIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.blue,
    );
  }

  Widget _buildMessageItem({required int index, required ChatModel chat}) {
    Message msg = chat.messages[index];
    return msg.isSentByMe ? messageSentByMe(msg: msg) : _buildReceivedMessage(msg: msg, avatar: chat.avatar);
  }

  Widget messageSentByMe({required Message msg}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        Flexible(
            flex: 6,
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  msg.content,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ))),
      ],
    );
  }

  Widget _buildReceivedMessage({required Message msg, required String avatar}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Helper.buildCircleAvatar(avatar: avatar),
        Flexible(
            flex: 6,
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xffefefef),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(msg.content))),
        Flexible(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }

}
