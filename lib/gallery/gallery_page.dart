import 'package:flutter/material.dart';
import 'package:flutter_dribbble_gallery/challenges/challenge.dart';
import 'package:flutter_dribbble_gallery/challenges/challenge_list_state.dart';
import 'package:flutter_dribbble_gallery/challenges/dragthis/drag_this_page.dart';
import 'package:flutter_dribbble_gallery/gallery/gallery_theme.dart';
import 'package:provider/provider.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ChallengeListComponent(
        [
          ChallengeEntry("Drag this", const DragThisPage()),
        ],
      ),
      child: Builder(builder: (context) {
        return Theme(
          data: GalleryTheme.themeData,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Gallery"),
            ),
            body: _galleryBody(context),
          ),
        );
      }),
    );
  }

  Widget _galleryBody(BuildContext context) {
    return ListView(
      children: context
          .read<ChallengeListComponent>()
          .challenges
          .map((e) => ListTile(
                title: Text(e.title),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => e.widget),
                ),
              ))
          .toList(),
    );
  }
}
