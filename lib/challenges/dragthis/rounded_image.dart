import 'package:flutter/material.dart';
import 'package:flutter_dribbble_gallery/challenges/dragthis/panning_image.dart';

import 'data/Album.dart';

class RoundedImage extends StatelessWidget {
  final Album album;
  final double scalingPercent;

  const RoundedImage({
    required this.album,
    required this.scalingPercent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: PanningImage(
        scalingPercent: scalingPercent,
        imageUrl: album.albumCoverUrl,
      ),
    );
  }
}
