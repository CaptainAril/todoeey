import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const Todoeey());
}

class Todoeey extends StatelessWidget {
  const Todoeey({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
