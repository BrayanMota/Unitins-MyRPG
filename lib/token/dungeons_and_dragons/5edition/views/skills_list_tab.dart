import 'package:flutter/material.dart';

class ItemsListTab extends StatefulWidget {
  const ItemsListTab({Key? key}) : super(key: key);

  @override
  State<ItemsListTab> createState() => _ItemsListTabState();
}

class _ItemsListTabState extends State<ItemsListTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Lista de Truques e Magias do personagem."),
    );
  }
}
