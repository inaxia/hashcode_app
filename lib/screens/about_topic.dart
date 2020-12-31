import 'package:flutter/material.dart';
import 'package:hashcode/custom/custom_colors.dart';
import 'package:hashcode/custom/page_transitions/slide_left_route.dart';
import 'package:hashcode/screens/code.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutTopic extends StatefulWidget {
  final List lesson;

  AboutTopic({this.lesson});

  @override
  _AboutTopicState createState() => _AboutTopicState();
}

class _AboutTopicState extends State<AboutTopic> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.lesson[1]),
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        enableCaption: false,
        hideThumbnail: true,
        controlsVisibleAtStart: true,
        forceHD: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 1.0,
      backgroundColor: customDarkBlack,
      title: Text('About'),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        FlatButton.icon(
          label: Text(
            'Code',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.code,
            color: Colors.white,
          ), 
          onPressed: () {
            Navigator.push(
              context,
              SlideLeftRoute(
                page: Code()
              ),
            );
          },
        ),
      ],
    );

    final body = YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16/9,
        showVideoProgressIndicator: true,
        bottomActions: <Widget>[
          SizedBox(width: 14.0),
          CurrentPosition(),
          SizedBox(width: 8.0),
          ProgressBar(
            isExpanded: true, 
            colors: ProgressBarColors(
              playedColor: Color(0xFFFF0000),
              handleColor: Color(0xFFFF0000),
              backgroundColor: Colors.grey,
              bufferedColor: Colors.white
            ),
          ),
          RemainingDuration(),
        ],
      ),
      builder: (context, player) {
        return Column(
          children: [
            player,
            Text('hello')
          ],
        );
      },
    );

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}
