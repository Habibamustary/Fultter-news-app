import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => new _DetailsState();
}

class _DetailsState extends State<Details> {


  Map data;
  List userData;

  Future getData() async {
    http.Response response = await http
        .get("https://newsapi.org/v2/top-headlines?country=in&apiKey=4d6b2b9d7d9b4f4d8518b438c9a2e59d");
    data = json.decode(response.body);
    setState(() {
      userData = data["articles"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(

       body:ListView.builder(
           itemCount: userData == null ? 0 : userData.length,
           itemBuilder: (BuildContext context, int index){
             return Container(

               child: Padding(
                   padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                 new Image.network(
                userData[index]['urlToImage'],
                  fit: BoxFit.cover,
                  height: 100.0,
                  width: 100.0,
                ),

                  Text('${userData[index]["title"]}'),
                  ],
                ),

               ),
             );


           }

       ),
    );
  }
}

class Data {
  final int description;
  bool expanded;
  final String title;
  final String publishedAt;
  final String urlToImage;
  final String url;
  Data(this.description, this.expanded, this.title, this.publishedAt, this.urlToImage, this.url);
}