import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:pujapurohit/models/samples.dart';

class MusicPlayer extends StatefulWidget {
  MusicPlayer(index) : url = artis[index].music_link;
  AudioPlayer audioPlayer = AudioPlayer();
  String url;
  var audioPlayerState;

  int timeProgress = 0;
  int audioDuration = 0;

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          value: timeProgress.toDouble(),
          max: audioDuration.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  playMusic() async {
    await audioPlayer.resume();
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos); // Jumps to the given position within the audio file
  }

  String getTimeString(int seconds) {
    String minuteString = '${(seconds / 60).floor() < 10 ? 0 : ''}${(seconds / 60).floor()}';
    String secondString = '${seconds % 60 < 10 ? 0 : ''}${seconds % 60}';
    return '$minuteString:$secondString'; // Returns a string with the format mm:ss
  }

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  void initState() {
    super.initState();
    // initPlayer();
  }

  initPlayer() {
    widget.audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        widget.audioPlayerState = state;
      });
    });

    /// Optional
    widget.audioPlayer.setUrl(widget.url, isLocal: true).then((value) async {
      // var val = await widget.audioPlayer.getDuration();
      // widget.audioDuration = val;
      // print("hello");
      // });

      widget.audioDuration = 194;
      await widget.audioPlayer.getDuration();
      widget.audioPlayer.onDurationChanged.listen((Duration duration) {
        setState(() {
          widget.audioDuration = duration.inSeconds;
        });
      });
      widget.audioPlayer.onAudioPositionChanged.listen((Duration position) {
        if (widget.audioPlayer.state != PlayerState.PAUSED) {
          setState(() {
            widget.timeProgress = position.inSeconds;
          });
        }
      });
      // widget.audioPlayer.play(widget.url, isLocal: true);
    }); // Triggers the onDurationChanged listener and sets the max duration string
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.audioPlayer.release();
    widget.audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initPlayer();
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                widget.audioPlayer.state == PlayerState.PLAYING ? widget.pauseMusic() : widget.playMusic();
              },
              icon: Icon(widget.audioPlayer.state == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.getTimeString(widget.timeProgress)),
              SizedBox(width: 20),
              Container(
                  width: 200,
                  child: Container(
                    width: 300.0,
                    child: Slider.adaptive(
                        value: widget.timeProgress.toDouble(),
                        max: widget.audioDuration.toDouble(),
                        onChanged: (value) {
                          widget.seekToSec(value.toInt());
                        }),
                  )),
              SizedBox(width: 20),
              Text(widget.getTimeString(widget.audioDuration))
            ],
          )
        ],
      ),
    );
  }
}
