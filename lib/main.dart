import 'package:flutter/material.dart';
import 'package:pagedapp/pages/home.dart';
import 'package:pagedapp/pages/loading.dart';
import 'package:pagedapp/pages/choose_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => MyBottomNavigationBar(),
        '/location': (context) => ChooseLocation(),
      },
    );
  }
}


class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    ChooseLocation(),
    Loading(),
  ];

  void onTappedBar(int index) {
    setState((){
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: onTappedBar,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),

                  title: Text('Home')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings')
              ),
            ]
        ));
  }
}

