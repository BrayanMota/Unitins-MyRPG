import 'package:flutter/material.dart';
import 'package:my_rpg/mock/classes.dart';
import '../models/more_character.dart';

class CharacterMoreFeatures extends StatefulWidget {
  const CharacterMoreFeatures({Key? key}) : super(key: key);

  @override
  State<CharacterMoreFeatures> createState() => _CharacterMoreFeaturesState();
}

class _CharacterMoreFeaturesState extends State<CharacterMoreFeatures> {
  final _formKey = GlobalKey<FormState>();

  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _eyesController = TextEditingController();
  final _skinController = TextEditingController();
  final _hairController = TextEditingController();
  final _alliesAndOrganizationsController = TextEditingController();
  final _characteristicsAndTalentsController = TextEditingController();
  final _treaturesController = TextEditingController();
  final _historyController = TextEditingController();


  late MoreCharacterModel moreCharacterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        // CustomSliverAppBar(
        //   textTopSliver: 'Características',
        //   centerTitle: true,
        // ),
        SliverPadding(
          padding: EdgeInsets.all(15),
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
                    hintText: '32',
                    labelText: 'Idade',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '1,79',
                    labelText: 'Altura',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _heightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '83,5',
                    labelText: 'Peso',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _weightController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: '1,79',
                    labelText: 'Altura',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _skinController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Azuis',
                    labelText: 'Cor dos Olhos',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _eyesController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Branca',
                    labelText: 'Cor da Pele',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _hairController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Organização dos Bardos',
                    labelText: 'Aliados e Organizações',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _alliesAndOrganizationsController,
                ),
                SizedBox(height: 20),
                TextFormField(
                maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Forte e Esperto',
                    labelText: 'Características e Talentos',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _characteristicsAndTalentsController,
                ),SizedBox(height: 20),
                TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Ouro de Elfo',
                    labelText: 'Tesouros',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  controller: _treaturesController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: '...',
                    labelText: 'História do Personagem',
                    labelStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(),
                  ),
                  
                  controller: _historyController,
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
                          moreCharacterModel = MoreCharacterModel(
                            age: _ageController.text,
                            height: _heightController.text,
                            weight: _weightController.text,
                            eyes: _eyesController.text,
                            skin: _skinController.text,
                            hair: _hairController.text,
                            alliesAndOrganizations: _alliesAndOrganizationsController.text,
                            characteristicsAndTalents: _characteristicsAndTalentsController.text,
                            treatures: _treaturesController.text,
                            history: _historyController.text,
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
            leading: Icon(Icons.more),
            title: Text(classes[index]),
          ),
        );
      }, childCount: classes.length),
    );
  }
}
