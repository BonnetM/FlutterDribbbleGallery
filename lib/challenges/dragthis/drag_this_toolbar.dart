import 'package:flutter/material.dart';

class DragThisToolbar extends StatelessWidget {
  const DragThisToolbar({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.more_vert),
          Text("MENU", style: Theme.of(context).textTheme.caption),
          Expanded(child: Icon(Icons.remove_circle_outline_sharp)),
          Icon(Icons.account_circle_outlined),
        ],
      ),
    );
  }
}
