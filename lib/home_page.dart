import 'package:flutter/material.dart';
import 'package:my_rpg/character/view/character_tab.dart';
import 'package:my_rpg/character/view/character_attributes_tab.dart';
import 'package:my_rpg/character/view/skills_list_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 6.0,
          title: const Text('Unitins My RPG'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: FaIcon(FontAwesomeIcons.userShield),
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.idCard),
              ),
              Tab(
                icon: FaIcon(FontAwesomeIcons.wandSparkles),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            CharacterAttributesTab(),
            CharacterTab(),
            ItemsListTab(),
          ],
        ),
      ),
    );
  }
}
