import 'package:flutter/material.dart';
import 'package:my_rpg/utils/widget.dart';

class CharacterFeatures extends StatefulWidget {
  const CharacterFeatures({Key? key}) : super(key: key);

  @override
  State<CharacterFeatures> createState() => _CharacterFeaturesState();
}

class _CharacterFeaturesState extends State<CharacterFeatures> {
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
        SliverPadding(padding: EdgeInsets.only(top: 8)),
        _gridSystems()
      ],
    );
  }

  Widget _features() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Text('Classe'),
          Text('Nível'),
          Text('Raça'),
          Text('Sub-Raça'),
          Text('Antecendente'),
          Text('Tendência'),
          TextFormField(),
        ],
      ),
    );
  }

  Widget _gridSystems() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisCount: 1,
        mainAxisExtent: 70,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Card(
          elevation: 3,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('${index + 1}° edition'),
          ),
        );
      }, childCount: 5),
    );
  }
}
