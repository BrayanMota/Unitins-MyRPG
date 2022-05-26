import 'package:flutter/material.dart';
import 'package:my_rpg/user/components/character_tab.dart';
import 'package:my_rpg/user/components/items_list_tab.dart';
import 'package:my_rpg/user/components/skills_list_tab.dart';

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
          title: const Text('Unitins My RPG'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.emoji_people),
              ),
              Tab(
                icon: Icon(Icons.flash_on),
              ),
              Tab(
                icon: Icon(Icons.shield),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            CharacterTab(),
            SkillsListTab(),
            ItemsListTab(),
          ],
        ),
      ),
    );
  }
}
