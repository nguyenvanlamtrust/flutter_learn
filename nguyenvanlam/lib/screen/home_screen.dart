import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nguyenvanlam/model/chat_model.dart';
import 'package:nguyenvanlam/utils/const_images.dart';
import 'package:nguyenvanlam/utils/const_routes.dart';
import 'package:nguyenvanlam/utils/helper.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  List<ChatModel> get messages {
    if(listChat.isNotEmpty) {
      return listChat;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: Container(
        decoration: const BoxDecoration(
            //color: Color(0xffefefef)
            ),
        child: Column(
          children: [
            _buildSearchInput(),
            _buildTopActivePeoPles(),
            Expanded(child: _buildListFriends())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
          ),
          label: 'Chats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera),
          label: 'Story',
        ),
      ]),
    );
  }

  Widget _buildSearchInput() {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffefefef),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search, size: 25),
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 129, 128, 128),
              fontSize: 20,
            )),
      ),
    );
  }

  Widget _buildTopActivePeoPles() {
    return Container(
        height: 120,
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 60,
              child: Column(
                children: [
                  //random avatar 
                  Flexible(flex: 2, child: Helper.buildCircleAvatar(avatar: index % 2 == 0 ? Images.woman : Images.man)),
                  Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        [
                          'Parent',
                          'Mother',
                          'Sister',
                          'Friend',
                          'People',
                          'Family',
                          'Company'
                        ][Random().nextInt(7)],
                        //'texttexttexttexttexttexttexttexttexttexttexttexttexttexttexttext',
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 15);
          },
          itemCount: 20,
        ));
  }

  Widget _buildListFriends() {
    return ListView.separated(
      itemCount: listChat.length,
      itemBuilder: ((context, index) {
        return InkWell(
            child: GestureDetector(
          child: _buildListFriendsItem(index: index, isSeen: index % 2 == 0 ? true : false, avatar: listChat[index].avatar),
          onTap: () async {
            final result = await Navigator.of(context).pushNamed(RouteNames.chat, arguments: listChat[index]);
          },
        ));
      }),
      separatorBuilder: ((context, index) {
        return const SizedBox(width: double.infinity, height: 15);
      }),
    );
  }

  Widget _buildListFriendsItem({required int index, bool isSeen = true, required String avatar}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: const BoxDecoration(),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Helper.buildCircleAvatar(avatar: avatar),
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  listChat[index].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: isSeen ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  listChat[index].chat,
                  style: TextStyle(
                    fontWeight: isSeen ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),
          Flexible(flex: 2, child: _buildSeenStatus()),
        ],
      ),
    );
  }

  Widget _buildSeenStatus() {
    return Container();
  }
}
