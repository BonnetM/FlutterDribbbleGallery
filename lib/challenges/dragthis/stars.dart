import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final int rating;

  const Stars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> stars = [];
    for (var i = 0; i < rating; i++)
      stars.add(Icon(
        Icons.star,
        color: Color(0xFFF4B631),
      ));
    for (var i = 5; i > rating; i--)
      stars.add(Icon(
        Icons.star,
        color: Color(0x55F4B631),
      ));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }
}
