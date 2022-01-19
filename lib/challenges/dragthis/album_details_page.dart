import 'package:flutter/material.dart';
import 'package:flutter_dribbble_gallery/challenges/dragthis/theme.dart';

import 'album_details.dart';
import 'data/Album.dart';
import 'drag_this_toolbar.dart';

class AlbumDetailsPage extends StatelessWidget {
  final Album album;

  const AlbumDetailsPage({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: DragThisTheme.data,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              DragThisToolbar(context: context),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
                child: Column(
                  children: [
                    Hero(
                      tag: "hero-tag:${album.name}",
                      child: AlbumDetails(
                        scalingPercent: 0,
                        album: album,
                        transparency: 0,
                        padding: 0,
                        detailsMode: AlbumDetailsMode.PLAYER,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
