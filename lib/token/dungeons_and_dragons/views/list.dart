import 'package:flutter/material.dart';

import '../../../utils/widget.dart';
import '../5edition/views/character_features.dart';

class ListEditions extends StatefulWidget {
  const ListEditions({Key? key}) : super(key: key);

  @override
  State<ListEditions> createState() => _ListEditionsState();
}

class _ListEditionsState extends State<ListEditions> {
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
          title: 'Sistemas',
          centerTittle: true,
        ),
        SliverPadding(padding: EdgeInsets.only(top: 8)),
        _gridSystems()
      ],
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CharacterFeatures()),
              );
            },
          ),
        );
      }, childCount: 5),
    );
  }
}
