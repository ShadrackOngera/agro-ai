import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
