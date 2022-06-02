import 'package:flutter/material.dart';
import 'package:my_rpg/user/pages/list.dart';

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
    return const ListCharacters();
  }
}
