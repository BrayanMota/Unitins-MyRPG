import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_rpg/mock/alignments.dart';
import 'package:my_rpg/mock/backgrounds.dart';
import 'package:my_rpg/mock/races.dart';
import 'package:my_rpg/utils/widget.dart';
import 'package:my_rpg/mock/classes.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../models/features.dart';

class CharacterFeatures extends StatefulWidget {
  const CharacterFeatures({Key? key}) : super(key: key);

  @override
  State<CharacterFeatures> createState() => _CharacterFeaturesState();
}

class _CharacterFeaturesState extends State<CharacterFeatures> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _classController = TextEditingController();
  final _levelController = TextEditingController();
  final _raceController = TextEditingController();
  final _subRaceController = TextEditingController();
  final _backgroundController = TextEditingController();
  final _alignmentController = TextEditingController();

  late FeatureModel featureModel;

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
          textTopSliver: 'Características',
          centerTitle: true,
        ),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: _features(),
        ),
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
                  decoration: InputDecoration(
                    hintText: 'Bruenor',
                    labelText: 'Nome do personagem',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                DropdownSearch<String>(
                  selectedItem: 'Classe',
                  items: classes,
                  popupProps: PopupPropsMultiSelection.menu(
                    showSelectedItems: true,
                  ),
                  onChanged: (value) {
                    _classController.text = value!;
                  },
                  validator: (item) {
                    if (item == null) {
                      return "Campo obrigatório";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: '1',
                    labelText: 'Nível',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _levelController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                DropdownSearch<String>(
                  selectedItem: 'Raça',
                  items: races,
                  popupProps: PopupPropsMultiSelection.menu(
                    showSelectedItems: true,
                  ),
                  onChanged: (value) {
                    _raceController.text = value!;
                  },
                  validator: (item) {
                    if (item == null) {
                      return "Campo obrigatório";
                    }
                  },
                ),
                SizedBox(height: 20),
                DropdownSearch<String>(
                  selectedItem: 'Sub-Raça',
                  items: [],
                  popupProps: PopupPropsMultiSelection.menu(
                    showSelectedItems: true,
                  ),
                  onChanged: (value) {
                    _subRaceController.text = value!;
                  },
                  validator: (item) {
                    if (item == null) {
                      return "Campo obrigatório";
                    }
                  },
                ),
                SizedBox(height: 20),
                DropdownSearch<String>(
                  selectedItem: 'Antecedente',
                  items: backgrounds,
                  popupProps: PopupPropsMultiSelection.menu(
                    showSelectedItems: true,
                  ),
                  onChanged: (value) {
                    _backgroundController.text = value!;
                  },
                  validator: (item) {
                    if (item == null) {
                      return "Campo obrigatório";
                    }
                  },
                ),
                SizedBox(height: 20),
                DropdownSearch<String>(
                  selectedItem: 'Tendência',
                  items: alignments,
                  popupProps: PopupPropsMultiSelection.menu(
                    showSelectedItems: true,
                  ),
                  onChanged: (value) {
                    _alignmentController.text = value!;
                  },
                  validator: (item) {
                    if (item == null) {
                      return "Campo obrigatório";
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: Text('Continuar'),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          featureModel = FeatureModel(
                            name: _nameController.text,
                            className: _classController.text,
                            level: int.parse(_levelController.text),
                            race: _raceController.text,
                            subRace: _subRaceController.text,
                            background: _backgroundController.text,
                            alignment: _alignmentController.text,
                          );
                        }
                      },
                    ),
                  ],
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
