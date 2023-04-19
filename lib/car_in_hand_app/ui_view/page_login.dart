import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _password;
  late String _icloudEmail;
  bool _isLoading = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      // Lógica para validar as credenciais do usuário aqui.
      Future.delayed(const Duration(seconds: 2)).then((_) {
        // Neste exemplo, assumimos que as credenciais do usuário são válidas.
        Navigator.pushReplacementNamed(context, '/home');
      }).catchError((error) {
        setState(() {
          _isLoading = false;
        });

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text('Erro de login'),
              content: const Text(
                  'Credenciais inválidas. Por favor, tente novamente.'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32.0),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CupertinoTextField(
                        placeholder: 'Login',
                        onChanged: (value) => _username = value,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      CupertinoTextField(
                        placeholder: 'Senha',
                        onChanged: (value) => _password = value,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 5.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Navegue para a tela de redefinição de senha
                            Navigator.pushNamed(context, '/reset-password');
                          },
                          child: const Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    // Navegue para a tela de redefinição de senha
                    Navigator.pushNamed(context, '/reset-password');
                  },
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                _isLoading
                    ? CupertinoActivityIndicator()
                    : CupertinoButton(
                        child: Text('Entrar'),
                        onPressed: _submitForm,
                        color: Colors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 90.0, vertical: 18.0),
                      ),
                const SizedBox(height: 50.0),
                const Text(
                  'Ou cadastre-se usando',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInButton(
                      Buttons.Facebook,
                      mini: true,
                      onPressed: () {
                        // Lógica para login com o Facebook aqui.
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    SignInButton(
                      Buttons.Apple,
                      mini: true,
                      onPressed: () {
                        // Lógica para login com o iCloud aqui.
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    SignInButton(
                      Buttons.Email,
                      mini: true,
                      onPressed: () {
                        // Lógica para login com o Google aqui.
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
