import 'package:flutter/material.dart';
import 'package:wp_flutter_app/homepage.dart';
import 'content_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Awesome App",
      home: Homepage(),
      routes: {ContentScreen.routeName: (context) => ContentScreen()},
    );
  }
}
