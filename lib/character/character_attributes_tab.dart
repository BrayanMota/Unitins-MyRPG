import 'package:flutter/material.dart';
import 'package:my_rpg/character/shared/basic_attributes.dart';

class CharacterAttributesTab extends StatefulWidget {
  const CharacterAttributesTab({Key? key}) : super(key: key);

  @override
  State<CharacterAttributesTab> createState() => _CharacterAttributesTabState();
}

class _CharacterAttributesTabState extends State<CharacterAttributesTab> {
  Future<void> _askedToLead() async {
    switch (await showDialog<BasicAttributes>(
        context: context,
        builder: (BuildContext context) {
          return const SimpleDialog(
            title: Text('Força'),
            children: <Widget>[
              Text('Teste')
            ]
          );
        }
    )) { }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: Card(
            child: InkWell(
              splashColor: Colors.black45,
              onTap: _askedToLead,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  Text(
                    'Força',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '+5',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '15',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

