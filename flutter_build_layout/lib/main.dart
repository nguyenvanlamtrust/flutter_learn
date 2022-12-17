import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildImageSection(),
            Padding(padding: const EdgeInsets.all(40.0), child: Column(
              children: [
              _buildTitleSection(),
              _buildButtonsSection(),
              _buildContentSection(),
              ],
            ))
          ],
        ),
      ),
    );
  }
  
  Widget _buildImageSection() {
    return Image.asset(
      'images/lake.jpg',
      fit: BoxFit.cover,
    );
  }
  
  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Oeschinen Lake Campground',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: const [
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text('41')
          ],
        ),
      ],
    );
  }
  
  Widget _buildContentSection() {
    return const Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
      style: TextStyle(
        
      )
    );
  }
  
  Widget _buildButtonsSection() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(Colors.blue, Icons.call, 'call'),
          _buildButton(Colors.blue, Icons.router, 'router'),
          _buildButton(Colors.blue, Icons.share, 'share'),
        ],
      ),
    );
  }

  Column _buildButton(Color color, IconData icon, String label) {
    return Column(
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              label.toUpperCase(),
              style: TextStyle(
                color: color,
              ),
            ),
          ),
        ],
      );
  }
}