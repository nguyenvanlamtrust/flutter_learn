import 'package:flutter/material.dart';
import 'flutter_buoi_10.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bài tập buổi 10'),
        ),
        body: _buildHomePage(),
      ),
    );
  }

  String get _txtSignUp => 'SING UP';

  Widget _buildLabel(String text, double fSize) {
    return Text(text, style: TextStyle(fontWeight: FontWeight.w500, fontSize: fSize));
  }

  Widget _buildHomePage() {
    return Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTitle(),
            _buildInput('Email', 'Enter your email'),
            _buildSpacer(),
            _buildInput('Password', 'Enter your password'),
            _buildSpacer(),
            _buildBtnSignUp(),
            _buildSpacer(),
            _buildLine(),
            _buildSpacer(),
            _buildSocialButtons(),
            _buildBottomText(),
          ],
        ));
  }

  Widget _buildSpacer() {
    return const SizedBox(height: 20);
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 30),
      child: _buildLabel(_txtSignUp, 30),
    );
  }

  Widget _buildInput(String text, String placeholder) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(text, 18),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
          ),
        )
      ],
    );
  }

  Color get activeColor => const Color.fromARGB(159, 220, 15, 107);

  Widget _buildBtnSignUp() {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: activeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        _txtSignUp,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBottomText() {
    return RichText(
      text: const TextSpan(text: 'Already a user? ', style: TextStyle(fontSize: 18, color: Colors.black), children: [
        TextSpan(text: 'LOGIN', style: TextStyle(decoration: TextDecoration.underline))
      ]),
    );
  }

  Widget _buildSocialButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        _buildBtnCircle('G', const Color.fromARGB(255, 200, 49, 38), 10),
        _buildBtnCircle('f', const Color.fromARGB(255, 89, 107, 171), 10),
        _buildBtnCircle('in', const Color.fromARGB(255, 58, 100, 184)),
      ]),
    );
  }

  Widget _buildBtnCircle(String text, Color color, [double mr = 0]) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.only(right: mr),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 3, color: color),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildLine() {
    return Stack(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      children: [
        const Divider(height: 60, color: Colors.grey),
        Positioned(
          top: 15,
          child: Container(padding: const EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(5)), child: const Text('OR')),
        ),
      ],
    );
  }
}
