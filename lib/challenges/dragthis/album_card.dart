import 'package:flutter/material.dart';

import 'album_details.dart';
import 'data/Album.dart';

class AlbumCard extends StatelessWidget {
  final double heightOffset;
  final double offsetFromCurrentCardInPercent;
  final Album album;

  final double totalHeight = 700;
  final double overflowHeight = 100;

  const AlbumCard({
    Key? key,
    required this.heightOffset,
    required this.offsetFromCurrentCardInPercent,
    required this.album,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = (64 - heightOffset).clamp(0, 64);
    final double transparencyInPercent;
    if (offsetFromCurrentCardInPercent > 0.5) {
      transparencyInPercent = 1;
    } else {
      transparencyInPercent = offsetFromCurrentCardInPercent;
    }
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0x55000000), blurRadius: 16, spreadRadius: 2)
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Hero(
          tag: "hero-tag:${album.name}",
          child: AlbumDetails(
            scalingPercent: offsetFromCurrentCardInPercent,
            album: album,
            transparency: transparencyInPercent,
            padding: padding,
            detailsMode: AlbumDetailsMode.CARD,
          ),
        ),
      ),
    );
  }
}
