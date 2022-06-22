import 'package:flutter/material.dart';

import 'user/views/list.dart';

void main() => runApp(const UnitinsMyRpg());

class UnitinsMyRpg extends StatelessWidget {
  const UnitinsMyRpg({Key? key}) : super(key: key);

  static const String _title = 'Unitins RPG App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: UnitinsMyRpgStatelessWidget(),
    );
  }
}

class UnitinsMyRpgStatelessWidget extends StatelessWidget {
  const UnitinsMyRpgStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const CharacterFeatures();
    return const ListCharacters();
  }
}
