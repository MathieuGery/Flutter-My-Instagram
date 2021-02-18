import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Container(
      child: Center(
        child: Text("Homepage Content", style:TextStyle(color: Colors.white)),
      ),
    );
  }
}
