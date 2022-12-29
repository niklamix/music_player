import 'package:flutter/material.dart';

import 'Music.dart';
import 'MusicPlayerPage.dart';

class MusicListPage extends StatefulWidget {
  const MusicListPage({super.key, required this.titlesAlbum});

  final String titlesAlbum;

  @override
  State<MusicListPage> createState() => _MusicListPageState();
}

class _MusicListPageState extends State<MusicListPage> {
  static Music linkinPark = Music("In the end", "Linkin Park", "In_the_End.mp3");
  static Music seether = Music("Careless Whisper", "Seether", "SeetherCarelessWhisper.mp3");
  static Music shinedown = Music("Scared of Change", "Shinedown", "Scared_of_Change.mp3");

  static List<Music> titles = [seether, linkinPark, shinedown];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.titlesAlbum, textAlign: TextAlign.center,)),
      ),
      body: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MusicPlayerPage(music: titles[index], titlesAlbum: widget.titlesAlbum);
                        },
                      ),
                      );
                    });
                  },
                  title: Text(titles[index].groupName + " - " + titles[index].name),
                )
            );
          }
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}