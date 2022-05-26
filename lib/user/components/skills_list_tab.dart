import 'package:flutter/material.dart';

class SkillsListTab extends StatefulWidget {
  const SkillsListTab({Key? key}) : super(key: key);

  @override
  State<SkillsListTab> createState() => _SkillsListTabState();
}

class _SkillsListTabState extends State<SkillsListTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Lista de habilidades."),
    );
  }
}
