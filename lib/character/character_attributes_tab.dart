import 'package:flutter/material.dart';
import 'package:my_rpg/character/shared/basic_attributes.dart';

class CharacterAttributesTab extends StatefulWidget {
  const CharacterAttributesTab({Key? key}) : super(key: key);

  @override
  State<CharacterAttributesTab> createState() => _CharacterAttributesTabState();
}

class _CharacterAttributesTabState extends State<CharacterAttributesTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(8.0, 16.0, 0, 0),
          child: Text(
            'Atributos Básicos',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Divider(
          thickness: 1,
          indent: 8,
          endIndent: 8,
          color: Colors.grey.shade700,
        ),
        BasicAttributes()
      ],
    );
  }
}
