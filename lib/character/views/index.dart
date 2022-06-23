import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'character_attributes.dart';
import 'character_features.dart';
import 'character_skills.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // elevation: 6.0,
          backgroundColor: Colors.black87,
          title: Text('Ficha de Personagem'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: FaIcon(FontAwesomeIcons.idCard),
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.userShield),
              ),
              // Tab(
              //   icon: FaIcon(FontAwesomeIcons.wandSparkles),
              // ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CharacterFeatures(),
            CharacterAttributes(),
            // const ItemsListTab(),
          ],
        ),
      ),
    );
  }
}
