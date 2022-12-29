import 'package:flutter/material.dart';

import 'MusicListPage.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({super.key});


  @override
  State<AlbumsPage> createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  List<String> titles = ["My favorite music"];

  final subtitles = [
    "Linkin Park, Seether, Shinedown",
  ];
  final icons = [Icons.picture_as_pdf];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Albums", textAlign: TextAlign.center,)),
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
                            return MusicListPage(titlesAlbum: titles[index]);
                          },
                        ),
                        );
                      });
                      /*ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(titles[index] + ' pressed!'),
                      ));*/
                      },
                    title: Text(titles[index]),
                    subtitle: Text(subtitles[index]),
                    leading: Image.network(
                        "https://images.unsplash.com/photo-1547721064-da6cfb341d50"
                    ),
                  )
              );
            }
            ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}