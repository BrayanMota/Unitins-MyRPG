import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../auth/models/auth.dart';
import '../auth/views/index.dart';
import '../character/views/index.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Menu'),
            backgroundColor: Colors.black87,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Novo personagem'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndexPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(
                context,
                listen: false,
              ).logout();
              AuthOrHomePage();
            },
          ),
        ],
      ),
    );
  }
}
