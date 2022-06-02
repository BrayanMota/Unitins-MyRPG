import 'package:flutter/material.dart';

import '../../utils/widget.dart';
import '../dungeons_and_dragons/pages/list.dart';

class ListSystems extends StatefulWidget {
  const ListSystems({Key? key}) : super(key: key);

  @override
  State<ListSystems> createState() => _ListSystemsState();
}

class _ListSystemsState extends State<ListSystems> {
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
          title: 'Systems',
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
              title: Text('Dungeons and Dragons'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListEditions()),
                );
              }),
        );
      }, childCount: 1),
    );
  }
}
