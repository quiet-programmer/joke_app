import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class RandomJokes extends StatefulWidget {
  @override
  _RandomJokesState createState() => _RandomJokesState();
}

class _RandomJokesState extends State<RandomJokes> {

  final String url = "https://api.chucknorris.io/jokes/random";
  String data;

  Future<String> _getJsonData() async {
    var response = await http.get(
      //encode URL
      Uri.encodeFull(url),
      //only accept json reponse
      headers: {"Accept": "application/json"},
    );

    //print(response.body);

    setState(() {
      var dataDecoded = json.decode(response.body);
      data = dataDecoded['value'].toString();
      data = dataDecoded['categories'];
    });

    return "Success";
  }

  // Widget _iosButton() {
  //   CupertinoButton(
  //     child: Text("Refresh Jokes"),
  //     onPressed: () {

  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[

          //ccontainer with the card view
          Container(
            width: double.infinity,
            height: 300,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(10.0),
            child: Card(
              elevation: 10.0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: data != null
                      ? Text(
                          "$data",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Jokes are loading...")
                          ],
                        ),
                ),
              ),
            ),
          ),

          //container with the button
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            width: double.infinity,
            decoration: BoxDecoration(),
            child: RaisedButton(
              color: Colors.pinkAccent,
              child: Text(
                "Refresh Jokes",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                _getJsonData();
              },
            ),
          )
        ],
      ),
    );
  }
}
