import 'package:flutter/material.dart';
import 'package:my_rpg/character/model/attribute_repository.dart';
import 'package:my_rpg/character/view_model/attribute_view_model.dart';

class CharacterAttributesTab extends StatefulWidget {
  final AttributeViewModel attributeViewModel =
      AttributeViewModel(repository: AttributeRepository());

  CharacterAttributesTab({Key? key}) : super(key: key);

  @override
  State<CharacterAttributesTab> createState() => _CharacterAttributesTabState();
}

class _CharacterAttributesTabState extends State<CharacterAttributesTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: widget.attributeViewModel.attributes(),
    );
  }
}
