import 'package:flutter/material.dart';
import 'package:sampleproject/pages/SubPage/Calender.dart';

void main() => runApp(const ManagerPage(
      title: '',
    ));

class ManagerMenu extends StatelessWidget {
  const ManagerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Menu'),
      ),
    );
  }
}

class ManagerPage extends StatefulWidget {
  const ManagerPage({Key? key, required String title}) : super(key: key);

  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  int currentIndex = 0;
  final screens = [
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 60),
      ),
    ),
    const Center(
      child: Calendar(),
    ),
    const Center(
      child: Text(
        'Chat',
        style: TextStyle(fontSize: 60),
      ),
    ),
    const Center(
      child: Text(
        'Profile',
        style: TextStyle(fontSize: 60),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_rounded),
            label: 'Calender',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    ));
  }
}
