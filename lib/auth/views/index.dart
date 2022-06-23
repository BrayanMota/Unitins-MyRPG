import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../user/views/list.dart';
import '../models/auth.dart';
import 'signin.dart';

class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    ///Caso esteja autenticado vai para a proxima tela do sistema : caso não vai para de autenticação
    ///troque o FirstPage pela tela que deseja redirecionar para ser a 1° após o login
    return auth.isAuth ? ListCharacters() : AuthPage();
  }
}
