import 'package:atvdd_fluoxograma/product_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  late List<dynamic> dados = [];

  void _login() async {
    http.Response resposta = await http.get(Uri.parse('http://10.109.83.8:3000/users'));
    dados = json.decode(resposta.body) as List;
  
    for (int i = 0; i < dados.length; i++) {
      print(dados[i]["username"]);
      print(dados[i]["password"]);

      if (_usernameController.text == dados[i]["username"] && _passwordController.text == dados[i]["password"]) {
        print("Login efetuado!");
        _usernameController.text = "";
        _passwordController.text = "";
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen()));
        return;
      }
    }
  }
  void _navigateToRegister() {
    Navigator.pushNamed(context, '/register');
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuário'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
            TextButton(
              onPressed: _navigateToRegister,
              child: Text('Não possui cadastro? Cadastre-se'),
            ),
          ],
        ),
      ),
    );
  
}
}

