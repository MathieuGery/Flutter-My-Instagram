import 'package:flutter/material.dart';
import 'package:flutter_instagram/Requests/user_interactions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_instagram/Views/single_picture.dart';
import 'package:transparent_image/transparent_image.dart';

import '../Classes/pageContent.dart';
import '../Classes/user.dart';

import '../Components/navbar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageContent = Provider.of<PageContent>(context);

    return Scaffold(
      body: pageContent.pageContent[pageContent.currentIndex],
      bottomNavigationBar: NavBar(),
    );
  }
}

class HomepageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    onPictureTap() async {
      await Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => SinglePicture(userID: ('test'))));
    }

    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>?>>(
        future: userInteract().getHomepagePictures(),
        builder:
            (context, AsyncSnapshot<List<Map<String, dynamic>?>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: height / 4,
                ),
                Center(
                    child: Text("Actuality",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32))),
                SizedBox(
                  height: height / 20,
                ),
                Expanded(
                  child: Container(
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      children: List.generate(snapshot.data!.length, (index) {
                        return GestureDetector(
                          onTap: onPictureTap,
                          child: Container(
                            child: FadeInImage.memoryNetwork(
                                fit: BoxFit.fitWidth,
                                placeholder: kTransparentImage,
                                image: snapshot.data![index]!['pictureLink']),
                          ),
                        );
                      }),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
