import 'package:flutter/material.dart';
import 'package:flutter_dribbble_gallery/gallery/gallery_page.dart';

class DribbbleGallery extends StatelessWidget {
  const DribbbleGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: GalleryPage());
  }
}
