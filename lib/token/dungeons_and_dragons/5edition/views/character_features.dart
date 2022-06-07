import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_rpg/utils/widget.dart';
import 'package:my_rpg/mock/classes.dart';

class CharacterFeatures extends StatefulWidget {
  const CharacterFeatures({Key? key}) : super(key: key);

  @override
  State<CharacterFeatures> createState() => _CharacterFeaturesState();
}

class _CharacterFeaturesState extends State<CharacterFeatures> {
  String dropdownValue = 'Classes';
  final list = ['Um', 'Dois', 'Três', 'Quatro', 'Cinco'];

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
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: classes.map(buildMenuItem).toList(),
              onChanged: (dropdownValue) {
                setState(
                  () {
                    this.dropdownValue = dropdownValue!;
                  },
                );
              },
            ),
          ),

          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nível',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Raça',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Sub-Raça',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Antecendente',
              labelStyle: TextStyle(fontSize: 16),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Tendência',
              labelStyle: TextStyle(fontSize: 16),
            ),
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
            title: Text('${classes[index]['name']}'),
          ),
        );
      }, childCount: classes.length),
    );
  }
}
