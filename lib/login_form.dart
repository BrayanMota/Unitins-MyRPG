import 'package:flutter/material.dart';

enum Type { Signup, Login }

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _passwordController = TextEditingController();
  //key q é usada pelo firebase
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  Type type = Type.Login;
  //map com o e-mail e senha
  Map<String, String> _loginData = {
    'email': '',
    'password': '',
  };

  bool _isLogin() => type == Type.Login;
  bool _isSignup() => type == Type.Signup;

//funcao que altera entre login e registrar-se
  void _changeMode() {
    setState(() {
      if (_isLogin()) {
        type = Type.Signup;
      } else {
        type = Type.Login;
      }
    });
  }

//metodo de entrar
  void _submit() {
    //garantia de validacao de formulario
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);

    _formKey.currentState?.save();

    

    if (_isLogin()) {
      //todo Login
    } else {
      //todo Registrar
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: _isLogin() ? 310 : 400,
        width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _loginData['email'] = email ?? '',
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().isEmpty || !email.contains('@')) {
                    return 'Informe um e-mail válido.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                controller: _passwordController,
                onSaved: (password) => _loginData['password'] = password ?? '',
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.isEmpty || password.length < 5) {
                    return 'Informe uma senha válida';
                  }
                  return null;
                },
              ),
              //se for pra se registrar é renderizado o confimar senha
              if (_isSignup())
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirmar Senha'),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: _passwordController,
                  validator: _isLogin()
                      ? null
                      : (_password) {
                          final password = _password ?? '';
                          if (password != _passwordController.text) {
                            return 'Senhas informadas não conferem.';
                          }
                          return null;
                        },
                ),
              SizedBox(height: 20),
              if (_isLoading)
                CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(
                    type == Type.Login ? 'ENTRAR' : 'REGISTRAR',
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                  ),
                ),
              Spacer(),
              //todo comentário
              //aqui é feita a alternancia entre modo LOGIN e REGISTRAR-SE
              //é colocado no botão uma mensagem condicional dependendo se o usuário está no login ou não
              TextButton(
                onPressed: _changeMode,
                child: Text(
                  _isLogin() ? 'DESEJA REGISTRAR?' : 'JÁ POSSUI CONTA?',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
