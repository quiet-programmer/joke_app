import 'package:flutter/material.dart';
import 'package:random_jokes/screens/home_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Random Dad Jokes",
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Colors.pinkAccent,
        fontFamily: 'serif',
      ),
      home: HomeScreen(),
    );
  }
}