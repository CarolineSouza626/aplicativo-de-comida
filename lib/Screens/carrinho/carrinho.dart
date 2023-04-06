import 'package:flutter/material.dart';

class Carrinho extends StatefulWidget {
  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Pedidos'),
    ));
  }
}
