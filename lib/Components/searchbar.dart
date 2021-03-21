import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter_instagram/Requests/user_interactions.dart';
import 'package:flutter_instagram/Views/userProfile.dart';

class Post {
  final String title;
  final String body;
  final user;

  Post(this.title, this.body, this.user);
}

class UserSearchBar extends StatelessWidget {
  @override
  final SearchBarController<Post> _searchBarController = SearchBarController();

  Future<List<Post>> _getALlPosts(String text) async {
    List<Map<String, dynamic>?> users =
        await userInteract().getUserBySearch(text);
    List<Post> posts = [];

    for (final user in users) {
      posts.add(Post(user?['username'], user?['biography'], user));
    }
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<Post>(
          textStyle: TextStyle(color: Colors.white),
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlPosts,
          searchBarController: _searchBarController,
          cancellationWidget:
              Text("Cancel", style: TextStyle(color: Colors.white)),
          emptyWidget: Text("empty", style: TextStyle(color: Colors.white)),
          header: Row(
            children: <Widget>[],
          ),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 1,
          minimumChars: 2,
          onItemFound: (Post post, int index) {
            return Container(
              color: Colors.black,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i.pinimg.com/originals/51/f6/fb/51f6fb256629fc755b8870c801092942.png"), // no matter how big it is, it won't overflow
                ),
                title: Text(post.title, style: TextStyle(color: Colors.white)),
                isThreeLine: true,
                subtitle: Text(post.body, style: TextStyle(color: Colors.grey)),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserProfile(
                        user: post.user,
                      ),
                    ),
                  );
                },
              ),
            );
          },
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
            Text(
              "Detail",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
