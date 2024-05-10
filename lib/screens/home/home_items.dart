import 'package:flutter/material.dart';


class HomeItems extends StatefulWidget {
  const HomeItems({super.key});

  @override
  State<HomeItems> createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(child: Column(children: [],),),);
  }
}