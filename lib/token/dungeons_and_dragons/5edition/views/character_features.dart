import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_rpg/mock/alignments.dart';
import 'package:my_rpg/mock/backgrounds.dart';
import 'package:my_rpg/mock/races.dart';
import 'package:my_rpg/utils/widget.dart';
import 'package:my_rpg/mock/classes.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CharacterFeatures extends StatefulWidget {
  const CharacterFeatures({Key? key}) : super(key: key);

  @override
  State<CharacterFeatures> createState() => _CharacterFeaturesState();
}

class _CharacterFeaturesState extends State<CharacterFeatures> {
  String dropdownValue = 'Classes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          title: 'Características',
          centerTittle: true,
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: _features(),
        ),
        // _list(),
      ],
    );
  }

  Widget _features() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome do personagem',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
          DropdownSearch<String>(
            items: classes,
            popupProps: PopupPropsMultiSelection.menu(
              showSelectedItems: true,
            ),
            onChanged: print,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nível',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
          DropdownSearch<String>(
            items: races,
            popupProps: PopupPropsMultiSelection.menu(
              showSelectedItems: true,
            ),
            onChanged: print,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Sub-Raça',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
          DropdownSearch<String>(
            items: backgrounds,
            popupProps: PopupPropsMultiSelection.menu(
              showSelectedItems: true,
            ),
            onChanged: print,
          ),
          DropdownSearch<String>(
            items: alignments,
            popupProps: PopupPropsMultiSelection.menu(
              showSelectedItems: true,
            ),
            onChanged: print,
          ),
          // _dropdown(),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  Widget _dropdown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _list() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(classes[index]),
          ),
        );
      }, childCount: classes.length),
    );
  }
}
