import 'package:flutter/material.dart';
import 'Details.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final Key keyOne = PageStorageKey('pageOne');
  final Key keyTwo = PageStorageKey('pageTwo');
  final Key keyThree = PageStorageKey('PageThree');

  int currentTab = 0;

  PageOne one;
  PageTwo two;
  PageThree three;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    one = PageOne(
      key: keyOne,

    );
    two = PageTwo(
      key: keyTwo,
    );

    three = PageThree(
      key: keyThree,
    );

    pages = [one, two, three];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BD NEWS"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.white,),
          onPressed: (){}
          ),

        ],
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('BD NEWS', style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),),
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
              ),
              ListTile(
                title: Text('Dhaka'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Rajshahi'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Comilla'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Rangpur'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Joypur'),
                onTap: () {
                  // Update the state of the app
                  Navigator.pop(context);
                },
              ),
            ],
          ) // We'll populate the Drawer in the next step!
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            title: Text('Top Stories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Popular"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            title: Text("Video"),
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  final List<Data> userData;

  PageOne({
    Key key,
    this.userData,
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {

  @override
  void initState() {
    super.initState();
//    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: new Image.asset('assets/images/food1.jpg'),
          ),
          new ListTile(
            title: new Text(
              'Malibu homes destroyed by wildfire', textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0),),
            subtitle: new Text(
              '2h | Bangladesh', textAlign: TextAlign.right, style: TextStyle(
              fontSize: 15.0,
              color: Colors.red,
            ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(),
                ),
              );
            },
          ),

          new Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: new Image.asset('assets/images/tramp.jpg'),
          ),
          new ListTile(
            title: new Text(
              'Trump Macron soat ahead', textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0),),
            subtitle: new Text(
              '1h | Us & Canada ', textAlign: TextAlign.right, style: TextStyle(
              fontSize: 15.0,
              color: Colors.red,
            ),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(),
                ),
              );
            },
          ),

          new Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: new Image.asset('assets/images/food1.jpg'),
          ),
          new ListTile(
            title: new Text(
              'Malibu homes destroyed by wildfire', textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0),),
            subtitle: new Text('1h | Africa', textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15.0,
                color: Colors.red,),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(),
                ),
              );
            },
          ),

          new Container(
            padding: EdgeInsets.only(bottom: 20.0),
            child: new Image.asset('assets/images/game.jpg'),
          ),
          new ListTile(
            title: new Text(
              'Malibu homes destroyed by wildfire', textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20.0),),
            subtitle: new Text('1h | Wales', textAlign: TextAlign.right,
              style: TextStyle(fontSize: 15.0,
                color: Colors.red,),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(),
                ),
              );
            },
          ),
//          new Stack(
//            children: <Widget>[
//              new Container(
//                padding: EdgeInsets.all(300.0),
//                decoration: BoxDecoration(
//                  image:DecorationImage(image: new AssetImage('assets/images/back.jpg',),
//                      fit: BoxFit.cover,
//                      ),
//                ),
//              ),
//            ],
//          ),
        ],
      ),

    );
  }
}


class PageTwo extends StatefulWidget {
  PageTwo({
    Key key,
  }) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {


  Map data;
  List userData;

  Future getData() async {
    http.Response response = await http
        .get(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=4d6b2b9d7d9b4f4d8518b438c9a2e59d");
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
    return Scaffold(
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              contentPadding: EdgeInsets.all(10.0),
              leading: new Image.network(
                userData[index]['urlToImage'],
                width: 110.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
              title: Text('${userData[index]["title"]}'),
              subtitle:
              Text(
                " ${userData[index]["description"]} ${userData[index]["publishedAt"]}",
              ),


              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BodyWidget(
                            Details_image: userData[index]["urlToImage"],
                            Details_title: userData[index]["title"],
                            Details_description: userData[index]["description"],
                            Details_content:userData[index] ["content"]
                        ),
                  ),
                );
              },
            );
          }
      ),

    );
  }
}


class BodyWidget extends StatefulWidget {

  final Details_image;
  final Details_title;
  final Details_description;
  final Details_content;

  BodyWidget(
      { this.Details_image,
        this.Details_title,
        this.Details_description,
        this.Details_content}
        );

  @override
  _BodyWidgetState createState() => new _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Popular News'),

      ),
      body: ListView(
        children: <Widget>[

          new Column(
      children: <Widget>[
        new Container(
          height: 200.0,
          color: Colors.red,
          child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.network(widget.Details_image,fit: BoxFit.cover,),

              )),
        ),

        new Container(
          height: 35.0,
        padding: EdgeInsets.symmetric(vertical: 2.0,horizontal:14.0, ),
          color:Colors.red ,
          child: new Text(widget.Details_title,style: TextStyle(
            color: Colors.white,
          ),),

        ),
        new SizedBox(height: 20.0),
        new Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: <Widget>[

              new Text(widget.Details_description,style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),),

              new SizedBox(height:   20.0,),
              new Text(widget.Details_content),
            ],
          ),
        ),
      ],
      ),


        ],
      ),
    );
  }
}


class PageThree extends StatefulWidget {
  PageThree({Key key}) : super(key: key);

  @override
  _State createState() => new _State();
}

class _State extends State<PageThree> {


  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white30,
      child: new GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          padding: const EdgeInsets.all(4.0),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: <String>[
            'https://images.financialexpress.com/2018/11/SabarimalaTemple-1.jpg',
            'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201811/ananth_kumar-647x363.jpeg?pB3Nc4dTwwWU.rwoTyOMLVbi76A6x4kQ',
            'https://images.financialexpress.com/2018/11/bse-pti-1-1.jpg',
            'https://static01.nyt.com/images/2018/11/13/us/13calfires-01/13calfires-01-facebookJumbo.jpg',
            "https://static.telegraphindia.com/derivative/THE_TELEGRAPH/1675048/2X1/image5b383d7c-3aea-4ebf-bca1-c17b460e5c94.jpg",
            "https://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/11/13/Pictures/_02cf4db2-e6e9-11e8-9800-40e053fa8e14.jpg",
            "http://ste.india.com/sites/default/files/2018/11/13/735020-shivraj-mp.gif",
            "https://www.hindustantimes.com/rf/image_size_960x540/HT/p2/2018/11/13/Pictures/premiere-marvel-avengers-hollywood-creator-producer-executive_ee8988b8-e6e3-11e8-9800-40e053fa8e14.jpg",

            "https://static.toiimg.com/thumb/msid-66598313,width-1070,height-580,imgsize-141041,resizemode-6,overlay-toi_sw,pt-32,y_pad-40/photo.jpg",
            "https://bsmedia.business-standard.com/_media/bs/img/article/2018-11/11/full/1541959641-4217.jpg",
            "https://c.ndtvimg.com/2018-09/f732kiac_aung-san-suu-kyi-650_625x300_13_September_18.jpg",
          ]
              .map((String url) {
            return new GridTile(

                child: new Image.network(url, fit: BoxFit.cover));
          }
          ).toList()),


    );
  }
}


class Data {
  final String description;
  bool expanded;
  final String title;
  final String publishedAt;
  final String urlToImage;
  final String content;

  Data(this.description, this.expanded, this.title, this.publishedAt,
      this.urlToImage, this.content);
}