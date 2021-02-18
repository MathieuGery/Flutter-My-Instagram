import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'dart:math';

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class UserSearchBar extends StatelessWidget {
  @override
  final SearchBarController<Post> _searchBarController = SearchBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<Post>(
          textStyle: TextStyle(color: Colors.white),
          iconActiveColor: Colors.white,
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          searchBarController: _searchBarController,
          placeHolder: Text("placeholder"),
          emptyWidget: Text("empty", style:TextStyle(color: Colors.white)),
          indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
          header: Row(
            children: <Widget>[
            ],
          ),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,

        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Text("Detail"),
          ],
        ),
      ),
    );
  }
}
