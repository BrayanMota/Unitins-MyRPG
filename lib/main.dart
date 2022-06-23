import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/models/auth.dart';
import 'auth/views/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        home: AuthOrHomePage(),
      ),
    );
  }
}
