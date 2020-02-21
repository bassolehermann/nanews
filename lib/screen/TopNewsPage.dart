import 'package:flutter/material.dart';
import 'package:nanews/screen/LectureScreen.dart';

class TopNewsScreen extends StatefulWidget {
  @override
  _TopNewsScreenState createState() => _TopNewsScreenState();
}

class _TopNewsScreenState extends State<TopNewsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(133, 137, 240, 1),
        title: Text(
          "Top News",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LectureScreen())),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/ouattara.jpeg"),
                        fit: BoxFit.cover)),
                margin: EdgeInsets.only(right: 5, left: 5, top: 5),
                height: height * 0.25,
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(133, 137, 240, 1),
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  "Yeclo.com",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "joseph Goli Ogou, chef central de Mama :<<Je suis sûr que Gbagbo sera bientôt en Côte d'Ivoire>>",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
