import 'package:flutter/material.dart';

class DragToListen extends StatelessWidget {
  const DragToListen({
    Key? key,
    required this.padding,
  }) : super(key: key);

  final num padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: padding.toDouble()),
        Icon(Icons.music_note_rounded),
        Text(
          "Drag to listen",
          style: Theme.of(context).textTheme.button,
        ),
        Icon(Icons.keyboard_arrow_down),
      ],
    );
  }
}
