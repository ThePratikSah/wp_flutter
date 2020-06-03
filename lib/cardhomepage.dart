import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class HomepageCard extends StatelessWidget {
  const HomepageCard({
    Key key,
    @required this.imageUrl,
    @required this.wpPost,
  }) : super(key: key);

  final imageUrl;
  final Map wpPost;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl),
            SizedBox(
              height: 10,
            ),
            Text(
              parse((wpPost['title']['rendered']).toString())
                  .documentElement
                  .text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(parse((wpPost['excerpt']['rendered']).toString())
                .documentElement
                .text)
          ],
        ),
      ),
    );
  }
}
