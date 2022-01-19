import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

class PanningImage extends StatelessWidget {
  final double scalingPercent;
  final String imageUrl;

  const PanningImage({
    Key? key,
    required this.scalingPercent,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double clampedScaling = scalingPercent.clamp(0, 1);
    return InteractiveViewer(
      panEnabled: false,
      scaleEnabled: false,
      transformationController: TransformationController(
        Matrix4Transform()
            .scale(1 + clampedScaling, origin: Offset(100, 100))
            .matrix4,
      ),
      minScale: 1,
      maxScale: 1.6,
      child: CachedNetworkImage(
        errorWidget: (context, url, error) => Text("error : $error"),
        imageUrl: imageUrl,
      ),
    );
  }
}
