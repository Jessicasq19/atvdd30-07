import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
      ),
      body: Center(
        child: Text('Bem-vindo à tela de produtos!'),
      ),
    );
  }
}
