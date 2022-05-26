import 'package:flutter/material.dart';

class CharacterAttributesTab extends StatefulWidget {
  const CharacterAttributesTab({Key? key}) : super(key: key);

  @override
  State<CharacterAttributesTab> createState() => _CharacterAttributesTabState();
}

class _CharacterAttributesTabState extends State<CharacterAttributesTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Atributos e Equipamentos do personagem."),
    );
  }
}
