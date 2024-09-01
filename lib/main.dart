import 'package:flutter/material.dart';
import 'package:navigation_bar_demo/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Bar',
      theme: ThemeData(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Text("Home Screen",
        style:
            TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: brown)),
    Text("Search Screen",
        style:
            TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: brown)),
    Text("Profile Screen",
        style:
            TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: brown)),
  ];
  void _onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: brown,
          title: const Text("Bottom navigation bar",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                color: snow,
              ))),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: snow,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: snow,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_rounded,
                color: snow,
              ),
              label: "Profile"),
        ],
        currentIndex: selectedIndex,
        backgroundColor: brown,
        onTap: _onItemTap,
      ),
    );
  }
}
