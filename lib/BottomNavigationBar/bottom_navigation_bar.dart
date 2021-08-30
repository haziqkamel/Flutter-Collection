import 'package:flutter/material.dart';
import 'package:flutter_collection/BottomNavigationBar/page/chatpage.dart';
import 'package:flutter_collection/BottomNavigationBar/page/favoritepage.dart';
import 'package:flutter_collection/BottomNavigationBar/page/homepage.dart';
import 'package:flutter_collection/BottomNavigationBar/page/profilepage.dart';

class BottomNavigationBarTutorial extends StatefulWidget {
  BottomNavigationBarTutorial({Key? key}) : super(key: key);

  @override
  _BottomNavigationBarTutorialState createState() =>
      _BottomNavigationBarTutorialState();
}

class _BottomNavigationBarTutorialState
    extends State<BottomNavigationBarTutorial> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    FavoritePage(),
    ChatPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar"),
        centerTitle: true,
      ),
      //IndexedStack help to retain the currentState of the screens when user switching between the screens
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        iconSize: 22,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorite',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'Chat',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
            // backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
