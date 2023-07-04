import 'package:flutter/material.dart';
import 'package:sampleproject/pages/SubPage/Calender.dart';
import 'package:sampleproject/pages/SubPage/Home.dart';
import 'package:sampleproject/pages/SubPage/Log.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:sampleproject/pages/SubPage/Profile.dart';

void main() => runApp(const EmployeePage(
      title: '',
    ));

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
      ),
    );
  }
}

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key, required String title}) : super(key: key);

  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  int currentIndex = 0;
  final screens = [
    const HomeScreen(),
    const Calendar(),
    const LogScreen(),
    const ProfilePage()
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
            icon: Icon(Icons.favorite),
            label: 'Calendar',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Log',
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
