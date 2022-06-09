import 'package:flutter/material.dart';
import 'package:my_rpg/utils/widget.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({Key? key}) : super(key: key);

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
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
          textTopSliver: 'Characters',
          centerTitle: true,
        ),
        SliverPadding(padding: EdgeInsets.only(top: 8)),
        // _listCharacters(),
        _gridCharacters()
      ],
    );
  }

  Widget _listCharacters() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return null;
      }, childCount: 10),
    );
  }

  Widget _gridCharacters() {
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
            title: Text('Character $index'),
            subtitle: Text('Dungeons and Dragons'),
          ),
        );
      }, childCount: 100),
    );
  }
}
