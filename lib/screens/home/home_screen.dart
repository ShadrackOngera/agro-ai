import 'package:agro_ai/screens/crops_screen.dart';
import 'package:agro_ai/screens/disease_screen.dart';
import 'package:agro_ai/screens/fertiliser_screen.dart';
import 'package:agro_ai/screens/home/home_items.dart';
import 'package:agro_ai/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> items = [
    const HomeItems(),
    const CropsScreen(),
    const FertiliserScreen(),
    const DiseaseScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Constants.black,
        currentIndex: _selectedIndex,
        unselectedIconTheme: IconThemeData(
          color: Constants.grey500,
        ),
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.filter_vintage_sharp),
            label: 'Crops',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.verified_user),
            label: 'Fertiliser',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.crib_outlined),
            label: 'Disease',
          ),
        ],
      ),
    );
  }
}
