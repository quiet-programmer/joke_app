import 'package:flutter/material.dart';
import 'package:random_jokes/screens/random_jokes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Dad Jokes"),
      ),
      body: RandomJokes(),
    );
  }
}