import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoApp extends StatefulWidget {
  final link;
  const VideoApp( {Key? key, this.link}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  late String videoId;

  @override
  void initState() {
    super.initState();
    print(widget.link);

    videoId = YoutubePlayer.convertUrlToId(widget.link)!;

  }



  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
    );
    return Scaffold(
      appBar: AppBar(),
        body:YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,


        )
    );
  }



  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
//Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),