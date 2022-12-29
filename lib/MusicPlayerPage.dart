import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'Music.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage({super.key, required this.music, required this.titlesAlbum});

  final Music music;
  final String titlesAlbum;

  @override
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);

    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('${widget.music.path}');
    audioPlayer.setSourceUrl(url.path);
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.titlesAlbum, textAlign: TextAlign.center,)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network("https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover
                ),
              ),
              const SizedBox(height: 32,),
              Text(widget.music.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              const SizedBox(height: 4,),
              Text(widget.music.groupName, style: const TextStyle(fontSize: 20),),
              Slider(
                value: position.inSeconds.toDouble(),
                min: 0,
                max: duration.inSeconds.toDouble() + 1,
                onChanged: (double value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration)),
                  ],
                )
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      //String url = 'https://media.chosic.com/wp-content/uploads/2022';
                      //await audioPlayer.play(url);
                      await audioPlayer.resume();
                    }
                  },
                )
              )
            ],
          )
        )
    );
  }
}