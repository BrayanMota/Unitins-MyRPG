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
  final _formKey = GlobalKey<FormState>();

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
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
                  validator: (String? item) {
                    if (item == null)
                      return "Required field";
                    else if (item == "Brazil")
                      return "Invalid item";
                    else
                      return null;
                  },
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
                ElevatedButton(
                  child: Text('Continuar'),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
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
