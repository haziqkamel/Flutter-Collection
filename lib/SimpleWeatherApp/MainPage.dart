import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String smiley = '🥵';
  int degrees = 45;
  Color backgroundColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('Simple Weather App'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              smiley,
              style: TextStyle(
                fontSize: 100,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '$degrees°C',
              style: TextStyle(
                fontSize: 80,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: changeWeather,
              child: Text(
                '👨🏼‍💻 Change Weather',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeWeather() {
    final counter = Random().nextInt(6);

    setState(() {
      switch (counter) {
        case 0:
          smiley = '🥶';
          degrees = nextNumber(min: -20, max: 0);
          backgroundColor = Colors.blueAccent.shade700;

          break;
        case 1:
          smiley = '🥵';
          degrees = nextNumber(min: 30, max: 45);
          backgroundColor = Colors.red;

          break;
        case 2:
          smiley = '☁️';
          degrees = nextNumber(min: 5, max: 20);
          backgroundColor = Colors.deepPurple;

          break;
        case 3:
          smiley = '🌧';
          degrees = nextNumber(min: 5, max: 20);
          backgroundColor = Colors.purple;

          break;
        case 4:
          smiley = '❄️';
          degrees = nextNumber(min: -5, max: 3);
          backgroundColor = Colors.blueAccent;

          break;
        case 5:
          smiley = '🌤';
          degrees = nextNumber(min: 20, max: 30);
          backgroundColor = Colors.orangeAccent;

          break;
      }
    });
  }

  int nextNumber({required int min, required int max}) =>
      min + Random().nextInt(max - min + 1);
}
