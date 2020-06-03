import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cardhomepage.dart';
import 'content_screen.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var api = "https://beebom.com/wp-json/wp/v2/posts/";
  var res, dataFetched;

  @override
  void initState() {
    // this initState is called when the app starts
    super.initState();
    // function to fetch data from the api
    fetchData();
  }

  // this fetchData function will be async as it will take
  // some time to fetch data from the api
  Future<List> fetchData() async {
    // by the time data is fetched, the app will do rest of the work
    // and to work with async, we have to wait for the data to be fetched
    // http.get() takes a url and returns the response, it is a get method
    res = await http.get(api);
    dataFetched = jsonDecode(res.body);
    return dataFetched;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Crazy Programmer"),
        elevation: 0.0,
      ),
      body: Center(
        // here we are checking if the response is null or not using conditional
        child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map wpPost = snapshot.data[index];
                  var imageUrl = wpPost['fimg_url'];
                  String postContent =
                      parse((wpPost['content']['rendered']).toString())
                          .documentElement
                          .text;
                  print(postContent);
                  return GestureDetector(
                    child: HomepageCard(imageUrl: imageUrl, wpPost: wpPost),
                    onTap: () {
                      Navigator.of(context).pushNamed(ContentScreen.routeName,
                          arguments: postContent);
                    },
                  );
                },
              );
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
