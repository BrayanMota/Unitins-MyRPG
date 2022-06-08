import 'package:flutter/material.dart';
import 'package:my_rpg/character/model/attribute_model.dart';
import 'package:my_rpg/character/view/shared/basic_attribute.dart';

class CharacterAttributesTab extends StatefulWidget {
  const CharacterAttributesTab({Key? key}) : super(key: key);

  @override
  State<CharacterAttributesTab> createState() => _CharacterAttributesTabState();
}

class _CharacterAttributesTabState extends State<CharacterAttributesTab> {
  final AttributeModel _attributeModel01 = AttributeModel('Força', 15, 3);
  final AttributeModel _attributeModel02 = AttributeModel('Destreza', 8, 1);
  final AttributeModel _attributeModel03 = AttributeModel('Constituição', 18, 4);
  final AttributeModel _attributeModel04 = AttributeModel('Inteligência', 16, 3);
  final AttributeModel _attributeModel05 = AttributeModel('Sabedoria', 16, 3);
  final AttributeModel _attributeModel06 = AttributeModel('Carisma', 14, 2);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        BasicAttribute(attributeModel: _attributeModel01),
        BasicAttribute(attributeModel: _attributeModel02),
        BasicAttribute(attributeModel: _attributeModel03),
        BasicAttribute(attributeModel: _attributeModel04),
        BasicAttribute(attributeModel: _attributeModel05),
        BasicAttribute(attributeModel: _attributeModel06),
      ],
    );
  }
}
