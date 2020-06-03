import 'package:flutter/material.dart';

class ContentScreen extends StatelessWidget {
  static const routeName = '/content-screen';
  @override
  Widget build(BuildContext context) {
    final content = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Fetch from WP'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Container(
                width: double.infinity,
                child: Text(content),
              ),
            )
          ],
        ),
      ),
    );
  }
}
