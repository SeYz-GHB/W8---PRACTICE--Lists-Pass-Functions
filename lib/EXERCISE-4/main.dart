import 'package:flutter/material.dart';
import './database/jokes.dart';
Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(home : JokesScreen()));

class JokesScreen extends StatelessWidget {
  const JokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body:SingleChildScrollView(
        child: Column(children: [
          ...jokes.map((joke) => 
          FavoriteCard(title: joke.title, description: joke.description, )).toList(),
        ],),
      )
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;


  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
  
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}


class _FavoriteCardState extends State<FavoriteCard> {
  bool _isFavorite = false;

  void onFavoriteClick() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(widget.description)
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
