import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nanews/Widget/widgetcontaineradmin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PolitiqueScreen extends StatefulWidget {
  @override
  _PolitiqueScreenState createState() => _PolitiqueScreenState();
}

class _PolitiqueScreenState extends State<PolitiqueScreen> {
    List contenu=List(10);
    RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if(mounted)
    setState(() {

    });
    _refreshController.loadComplete();
  }


  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("pull up load");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            }
            else if(mode == LoadStatus.canLoading){
                body = Text("release to load more");
            }
            else{
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SingleChildScrollView(
        
        child: Column(
          
          children: <Widget>[
            SizedBox(
              height: height*0.03,
            ),
            Container(
              padding: EdgeInsets.only(left:10),
              height: height*0.25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context,i){
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      image: DecorationImage(image: AssetImage("images/yaya.jpg"),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    height: height*0.25,
                    width: width*0.9,
                    margin:EdgeInsets.only(right: 20) ,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                         bottom: 40,
                         right: 0,
                         left: 0,
                         child: Container(
                           margin: EdgeInsets.only(left:20),

                           child: Text("Paraguay:Yaya Touré sur le point de rejoindre Emmanuel Adebayor ?",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                       )
                      ],
                    ),
                  );
                }),
            ),
            GestureDetector(
              onTap: ()=>null,
                          child: Container(
                height: height*0.05,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Plus de Top News"),
                      Icon(
                      Icons.arrow_forward_ios
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width:width,
              height:10,
              color:Colors.grey.shade50
            ),
            ...contenu.map((f) =>Column(
              children: <Widget>[
                containeradmin(context,comment: 14,like: 200,time: "17h",site: "nan.ci"),
                Container(
              width:width,
              height:10,
              color:Colors.grey.shade50
            )
                
              ],
            )),
           ],
        ),
      ),
      ), 
      
      
      
      
    );
  }
}