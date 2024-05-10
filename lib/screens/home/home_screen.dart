import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_vintage_sharp),
            label: 'Crops',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Fertiliser',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crib_outlined),
            label: 'Disease',
          ),
        ],
      ),
    );
  }
}
