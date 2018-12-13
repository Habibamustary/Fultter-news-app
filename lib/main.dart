import 'package:flutter/material.dart';
import 'Homepage.dart';


class CommonThings {
  static Size size;
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MediaQuery Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery
        .of(context)
        .size;
    print('Width of the screen: ${CommonThings.size.width}');
    return new Scaffold(
        body: Stack(
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage("assets/images/cover.jpg"),
                fit: BoxFit.cover,
              ),),
              child: new Center(
              child:  new Container(
              margin: EdgeInsets.only(bottom: 50.0,right: 15.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,

                    children: <Widget>[
//                      new RaisedButton(
//                        padding: EdgeInsets.all(5.0),
//
//                        child: const Text('Explore', style: TextStyle(
//                          fontSize: 20.0,
//                          color: Colors.white,
//                        ),),
//                        color: Theme
//                            .of(context)
//                            .accentColor,
//                        elevation: 4.0,
//                        shape: new RoundedRectangleBorder(
//                            borderRadius: new BorderRadius.circular(30.0)),
//                        onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Newspage()),
//                      );
//                        },
//                      ),

                      new RaisedButton(
                        padding: EdgeInsets.all(5.0),

                        child: const Text('Explore', style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),),
                        color: Theme
                            .of(context)
                            .accentColor,
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                        },
                      ),

                    ],
                  ),
                ),

    ),

            ),
          ],
        ),


    );
  }
}
