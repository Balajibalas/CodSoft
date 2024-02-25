import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quote_app/services/database.dart';
import 'package:quote_app/pages/fav.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isFavorite = false; // Track whether the heart button is pressed or not
  List<String> favorites = []; // Track favorite quotes
  late String currentQuote;

  @override
  void initState() {
    super.initState();
    currentQuote = _getRandomQuote();
  }

  String _getRandomQuote() {
    final random = Random();
    return Database.quotes[random.nextInt(Database.quotes.length)];
  }

  void _toggleFavorite() {
    setState(() {
      if (isFavorite) {
        favorites.remove(currentQuote); // Remove the quote from favorites
      } else {
        favorites.add(currentQuote); // Add the quote to favorites
      }
      isFavorite = !isFavorite; // Toggle the favorite state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Daily",
              style: TextStyle(
                color: Colors.pink[400],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Quotes    ",
              style: TextStyle(
                color: Colors.purple[600],
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [ // Add actions to the app bar
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                currentQuote = _getRandomQuote();
                isFavorite = false;
              });
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.bookmark_border_sharp, size: 30.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Fav(favorites: favorites)),
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0, bottom: 40.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(128, 244, 172, 195), // Set opacity to 50% (128 out of 255)
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentQuote,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.black,
                  size: 50.0,
                ),
                onPressed: () {
                  _toggleFavorite();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
