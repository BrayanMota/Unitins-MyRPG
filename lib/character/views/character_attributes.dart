import 'package:flutter/material.dart';

import 'package:my_rpg/character/view_model/attribute_view_model.dart';

import '../models/attribute_repository.dart';

class CharacterAttributes extends StatefulWidget {
  final AttributeViewModel attributeViewModel =
      AttributeViewModel(repository: AttributeRepository());

  CharacterAttributes({Key? key}) : super(key: key);

  @override
  State<CharacterAttributes> createState() => _CharacterAttributesState();
}

class _CharacterAttributesState extends State<CharacterAttributes> {
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
