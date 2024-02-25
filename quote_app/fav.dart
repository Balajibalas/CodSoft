import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  final List<String> favorites;

  const Fav({Key? key, required this.favorites}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Favourite",
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
      ),
      body: ListView.builder(
        itemCount: widget.favorites.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(),
            borderRadius: BorderRadius.circular(20.0)),
            margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
            height: 150.0,
            child: ListTile(
              title: Text(widget.favorites[index],
              style:TextStyle(
                color:Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                fontSize: 20.0
                 ) ,),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    widget.favorites.removeAt(index); // Remove the quote from favorites
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
