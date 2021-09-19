
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoApp extends StatefulWidget {
  final link;
  const VideoApp( {Key? key, this.link}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late String videoId;
  late YoutubePlayerController _youtubePlayerController;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  @override
  void initState() {
    super.initState();

    videoId = YoutubePlayer.convertUrlToId(widget.link)!;
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    _youtubePlayerController = YoutubePlayerController(
      flags: YoutubePlayerFlags(
        forceHD: false,
        hideThumbnail: true,
      ),
      initialVideoId: videoId,
    )..addListener(listener);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_youtubePlayerController.value.isFullScreen) {
      setState(() {
        _playerState = _youtubePlayerController.value.playerState;
        _videoMetaData = _youtubePlayerController.metadata;
      });

    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:YoutubePlayerBuilder(
          player: YoutubePlayer(

           onEnded: (metaData) {
             Navigator.of(context).pop();
             SystemChrome.setPreferredOrientations(DeviceOrientation.values);

           },
aspectRatio: 16/8.15,
            onReady: () {
              _isPlayerReady = true;
            },

            controller: _youtubePlayerController,
            showVideoProgressIndicator: true,
          ),
          builder: (context , player ) {
            return
                Padding(
                  padding:EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: ListTile(
                          title: Text('العوده'),
                            minLeadingWidth: 0,
                            contentPadding: EdgeInsets.only(right: 5),
                            horizontalTitleGap: 0,

                            leading: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
                            onTap: (){
                              if(_youtubePlayerController.value.isFullScreen){
                                SystemChrome.setPreferredOrientations(DeviceOrientation.values);

                              }else{
                                Navigator.of(context).pop();
                              }
                            }
                        ),
                      ),
                          player,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: Icon(
                                _youtubePlayerController.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: _isPlayerReady
                                  ? () {
                                _youtubePlayerController.value.isPlaying
                                    ? _youtubePlayerController.pause()
                                    : _youtubePlayerController.play();
                                    setState(() {
                                    });


                              }
                                  : null,
                            ),
                          ),
                          IconButton(
                            icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                            onPressed: _isPlayerReady
                                ? () {
                              _muted
                                  ? _youtubePlayerController.unMute()
                                  : _youtubePlayerController.mute();
                              setState(() {
                                _muted = !_muted;
                              });
                            }
                                : null,
                          ),
                          FullScreenButton(
                            controller: _youtubePlayerController,
                            color: Colors.blueAccent,
                          ),
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          const Text(
                            "الصوت",
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                          Expanded(
                            child: Slider(
                              inactiveColor: Colors.transparent,
                              value: _volume,
                              min: 0.0,
                              max: 100.0,
                              divisions: 10,
                              label: '${(_volume).round()}',
                              onChanged: _isPlayerReady
                                  ? (value) {
                                setState(() {
                                  _volume = value;
                                });
                                _youtubePlayerController.setVolume(_volume.round());
                              }
                                  : null,
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                );

          },
        )
    );
  }



  @override
  void dispose() {
    super.dispose();
    _youtubePlayerController.dispose();
  }

}
