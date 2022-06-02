import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final String title;
  final bool centerTittle;

  CustomSliverAppBar({
    Key? key,
    this.title = '',
    this.centerTittle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      centerTitle: centerTittle,
      backgroundColor: Colors.blueAccent,
    );
  }
}
