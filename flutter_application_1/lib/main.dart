import 'dart:math';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String get img => 'assets/animal.jpg';

  get names => generateWordPairs().take(50).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Messenger'),
        ),
        body: _buildHomeScreen(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Column(
      children: [
        _buildSearchInput(),
        _buildActivePeoples(),
        _buildListMessage(),
      ],
    );
  }

  Widget _buildSearchInput() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 237, 234, 234),
        border: Border.all(color: const Color.fromARGB(255, 237, 234, 234)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildActivePeoples() {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _buildActiveItemImage(),
              const Divider(height: 10),
              Text('${names[index]}'),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }

  Widget _buildListMessage() {
    return Expanded(
      child: ListView.separated(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: _buildMessageItemImage(Random().nextInt(names.length) % 2 == 0 ? true : false),
            title: _buildTitle(names[index].toString(), 20),
            subtitle: Text([
              'The view chat ended',
              'Test message',
            ][Random().nextInt(2)]),
            trailing: _buildTrailingListTitle(),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }

  Widget _buildImageItem([bool active = true]) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: CircleAvatar(
            backgroundImage: AssetImage(img),
          ),
        ),
        !active
            ? const Text('')
            : Positioned(
                bottom: 5,
                right: -8,
                child: Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _buildMessageItemImage([bool active = true]) {
    return _buildImageItem(active);
  }

  Widget _buildActiveItemImage([bool active = true]) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: _buildImageItem(active),
    );
  }

  Widget _buildTitle(String title, [double? fontSize]) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
        label: 'Chats',
        icon: Icon(Icons.chat),
      ),
      BottomNavigationBarItem(
        label: 'Story',
        icon: Icon(Icons.camera),
      ),
    ]);
  }

  Widget _buildTrailingListTitle() {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      padding: const EdgeInsets.all(1),
      child: const Center(
        child: Icon(Icons.check, color: Colors.white, size: 15)
      ),
    );
  }
}
