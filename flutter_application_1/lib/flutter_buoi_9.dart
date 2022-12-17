import 'package:flutter/material.dart';
Widget _buildHomePage() {
  return Container(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildParagraph(),
        _buildLine(),
        _buildStack(),
      ],
    ),
  );
}

Widget _buildParagraph() {
  return Column(
    children: [
      //row1
      _buildTitle('Hàng thứ nhất'),
      const SizedBox(height: 10),

      //row 2
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: _buildTitle('Hàng thứ hai 1')),
          Expanded(child: _buildTitle('Hàng thứ hai 2'))
        ],
      ),
      const SizedBox(height: 10),

      //row 3
      const Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Hàng thứ 3',
              style: TextStyle(color: Colors.grey),
            ),
            TextSpan(
              text: ' bold 1',
              style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      
    ],
  );
}

Widget _buildTitle(String str) {
  return Text(
    str,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.grey,
    ),
  );
}

Widget _buildStack() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        width: 100,
        height: 100,
        color: Colors.green,
      ),
      Positioned(
        top: 50,
        left: 50,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
      Positioned(
        top: 100,
        left: 100,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
        ),
      ),
    ],
  );
}

Widget _buildLine() {
  return const Divider(
    height: 5,
    thickness: 1,
    color: Colors.grey,
  );
}