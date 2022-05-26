import 'package:flutter/material.dart';

class CharacterTab extends StatefulWidget {
  const CharacterTab({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CharacterTabState();
}

class _CharacterTabState extends State<CharacterTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Descrição do personagem."),
    );
  }
}