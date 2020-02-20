import 'package:flutter/material.dart';
import 'package:flutter_playout/multiaudio/MultiAudioSupport.dart';
import 'package:flutter_playout/player_observer.dart';
import 'package:flutter_playout/video.dart';
import 'package:nanews/screen/LectureTvScreen.dart';


class Tv extends StatelessWidget  with PlayerObserver, MultiAudioSupport {
  List chaine =[
    "images/tfx.png",
    "images/tf1.png",
    "images/tfi.png",
    "images/tmc.png",
    "images/lci.png",
    "images/tmc.png",

  ];
  List listscreen=[
    "images/match.jpg",
    "images/neymar.jpg",
    "images/radi.jpg",
    "images/maison.jpg",
    "images/derby.jpg",
    "images/radi.jpg",

  ];
  List urlist=[
    "https://www.enovativecdn.com:4433/rticdn/smil:rti1.smil/playlist.m3u8",
    "https://www.enovativecdn.com:4433/rticdn/smil:rti2.smil/playlist.m3u8",
    "https://www.enovativecdn.com:4433/rticdn/smil:rti3.smil/playlist.m3u8",
    "https://edge7.vedge.infomaniak.com/livecast/ik:rtbtvlive1/chunklist_w984210027.m3u8",
    "http://v3fbs247hls-i.akamaihd.net/hls/live/219079/v3fbs247hls/v3fbs247hls_1_4.m3u8",
    "https://www.youtube.com/watch?v=yZCS6l0a-9c"
  ];

  void _onViewCreated(int viewId) {
    listenForVideoPlayerEvents(viewId);
    enableMultiAudioSupport(viewId);
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 13,
            mainAxisSpacing: 20,
          ),
          itemCount: chaine.length,
          itemBuilder: (context, i) {
            return bigCont(
                context, listscreen[i], chaine[i],urlist[i]);
          },
        ));
  }

  Widget bigCont(BuildContext context, String image, String chaine,String url) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true,builder: (_)=>Video(
            autoPlay: true,
            isLiveStream: true,
            url: url,
            onViewCreated: _onViewCreated,
          )));
        },
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              chaine,
              fit: BoxFit.cover,
              height: 20,
            ),
          ),
        ));
  }
}
