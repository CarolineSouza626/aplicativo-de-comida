import 'package:flutter/material.dart';

class CarrinhoAdm extends StatefulWidget {
  const CarrinhoAdm({super.key});

  @override
  State<CarrinhoAdm> createState() => _CarrinhoAdmState();
}

class _CarrinhoAdmState extends State<CarrinhoAdm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Pedidos'),
    ));
  }
}
