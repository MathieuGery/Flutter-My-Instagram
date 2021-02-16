import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Views/homepage.dart';

import 'Classes/pageContent.dart';
import 'Classes/user.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<User>.value(value: User()),
        ChangeNotifierProvider<PageContent>.value(value: PageContent())
      ],
      child: MaterialApp(
        title: 'Flutter Instagram',
        theme: new ThemeData(canvasColor: Colors.black),
        home: Homepage(),
      ),
    ),
  );
}
