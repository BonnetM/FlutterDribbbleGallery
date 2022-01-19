import 'package:flutter/material.dart';
import 'package:flutter_dribbble_gallery/challenges/dragthis/stars.dart';

import 'data/Album.dart';
import 'drag_to_listen.dart';
import 'rounded_image.dart';

enum AlbumDetailsMode { CARD, PLAYER }

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({
    Key? key,
    required this.scalingPercent,
    required this.album,
    required this.transparency,
    required this.padding,
    required this.detailsMode,
  }) : super(key: key);

  final double scalingPercent;
  final Album album;
  final double transparency;
  final num padding;
  final AlbumDetailsMode detailsMode;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (detailsMode == AlbumDetailsMode.PLAYER)
            TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 14,
                color: Colors.black,
              ),
              label: Text(
                "BACK",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          RoundedImage(album: album, scalingPercent: scalingPercent),
          if (detailsMode == AlbumDetailsMode.CARD)
            ..._cardContent(context)
          else
            ..._detailsContent(context),
        ],
      ),
    );
  }

  List<Widget> _detailsContent(BuildContext context) {
    return [
      SizedBox(height: 16),
      Text(album.songs[0].name, style: Theme.of(context).textTheme.subtitle2),
      SizedBox(height: 8),
      Text(album.band, style: Theme.of(context).textTheme.subtitle1),
      SizedBox(height: 16),
      SliderTheme(
          data: SliderThemeData(
            thumbColor: Color(0xFF2B3238),
            inactiveTrackColor: Color(0x55A6A7A9),
          ),
          child: Slider(value: 0, onChanged: (value) {})),
      Row(
        children: [Text("00:00"), Spacer(), Text(album.songs[0].duration)],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: Icon(Icons.repeat), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.fast_rewind, color: Color(0xFFA6A7A9)),
              onPressed: () {}),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF2B3238),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              iconSize: 48,
              onPressed: () {},
              icon: Icon(
                Icons.pause,
                //color: Colors.white,
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.fast_forward, color: Color(0xFFA6A7A9)),
              onPressed: () {}),
          IconButton(icon: Icon(Icons.shuffle), onPressed: () {}),
        ],
      )
    ];
  }

  List<Widget> _cardContent(BuildContext context) {
    return [
      SizedBox(height: 16),
      Center(
        child: Text(album.band, style: Theme.of(context).textTheme.subtitle1),
      ),
      Center(
        child: Text(album.name, style: Theme.of(context).textTheme.headline6),
      ),
      SizedBox(height: 16),
      Stars(rating: album.rating),
      Center(
        child: Opacity(
          opacity: 1 - transparency,
          child: DragToListen(padding: padding),
        ),
      ),
    ];
  }
}
