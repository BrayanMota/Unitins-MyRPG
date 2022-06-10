import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_rpg/character/token/views/character_features.dart';
import 'package:my_rpg/utils/widget.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({Key? key}) : super(key: key);

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CharacterFeatures(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          textTopSliver: 'Personagens',
          centerTitle: true,
        ),
        SliverPadding(padding: EdgeInsets.only(top: 8)),
        _listCharacters(),
      ],
    );
  }

  Widget _listCharacters() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            leading: Image.asset(
              'assets/icons/d&d_5e.jpg',
              width: 50,
              height: 50,
            ),
            // Icon(Icons.person),
            title: Text('Personagem $index'),
            subtitle: Text('Dungeons and Dragons 5° Edição'),
          ),
        );
      }, childCount: 100),
    );
  }
}
