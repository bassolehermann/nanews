import 'package:flutter/material.dart';

import 'package:nanews/screen/VideoRadioScreen/VideoBuzzScreen.dart';
import 'package:nanews/screen/SearchScreen.dart';
import 'package:nanews/screen/VideoRadioScreen/list_radio.dart';
import 'package:nanews/screen/VideoRadioScreen/tv.dart';

class VideoRadio extends StatefulWidget {
  @override
  _VideoRadioState createState() => _VideoRadioState();
}

class _VideoRadioState extends State<VideoRadio> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return DefaultTabController(length: 3, 
    child: Scaffold(
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
        color: Colors.white.withOpacity(0.5),
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
      indicatorColor: Colors.white,
      indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: Colors.white, width: 3.0),
      insets: EdgeInsets.symmetric(horizontal:height*0.040  )
            ),
            tabs: [
            Tab(text: "TV",),
            Tab(text: "Radio",),
            Tab(text: "Video Buzz",),
          ]),
          
        ),
      body: TabBarView(children: [
        Tv(),
        RadioList(),
        VideoBuzz(),
      ]),
    ));
  }
}