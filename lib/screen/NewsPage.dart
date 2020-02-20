import 'package:flutter/material.dart';
import 'package:nanews/screen/NewsScreen/PolitiqueScreen.dart';
import 'package:nanews/screen/NewsScreen/PourvousScreen.dart';
import 'package:nanews/screen/SearchScreen.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      initialIndex: 0,
      length: 12,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(133, 137, 240, 1),
        elevation: 0,
        leading: Stack(
          children: <Widget>[
            Container( 
                margin: EdgeInsets.only(left: 10),
                child: Image.asset("images/logo-nan.png")),
            Positioned(
             bottom: 2,
             right: 0,
             child: CircleAvatar(
               radius: 8,
               backgroundImage: AssetImage("images/ci.png",),
               
             ), 
            )
          ],
        ),
        title: GestureDetector(
          onTap: ()=>showSearch(context: context,delegate: ScreenSearchDelegate()),
                  child: Container(
            width: width * 0.7,
            height: height * 0.05,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(40)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: width * 0.04,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.white, fontSize: width * 0.04),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
              insets: EdgeInsets.symmetric(horizontal: height * 0.040)),
          tabs: <Widget>[
            Tab(
              text: "Pour Vous",
            ),
            Tab(text: "Politique"),
            Tab(
              text: "Société",
            ),
            Tab(
              text: "FootBall",
            ),
            Tab(
              text: "Divertissement",
            ),
            Tab(
              text: "Monde",
            ),
            Tab(
              text: "Sport",
            ),
            Tab(
              text: "Business",
            ),
            Tab(
              text: "LifeStyle",
            ),
            Tab(
              text: "Education",
            ),
            Tab(
              text: "Technologie",
            ),
            Tab(
              text: "Automobile",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PourvousScreen(),
          PolitiqueScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
          PourvousScreen(),
        ],
      ),
    );
  }
}
