import 'package:flutter/material.dart';
import 'package:nguyenvanlam/screen/chat_screen.dart';
import 'package:nguyenvanlam/screen/home_screen.dart';
import 'package:nguyenvanlam/utils/const_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//Warning: When using initialRoute, don’t define a home property.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.home,
      
      routes: {
        RouteNames.home: (context) => HomeScreen(),
        RouteNames.chat: (context) => ChatScreen(),
      },
    );
  }
}
