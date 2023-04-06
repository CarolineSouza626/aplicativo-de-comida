import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:marmita/Screens/cadastro/Cadastro_categoria.dart';
import 'package:marmita/Screens/cadastro/cadastro_produto.dart';
import 'package:marmita/Screens/inicial/lista_edita.dart';

import '../carrinho/carrinho_adm.dart';
import '../perfil/perfil.dart';

class HomePageAdm extends StatefulWidget {
  const HomePageAdm({super.key});

  @override
  State<HomePageAdm> createState() => _HomePageAdmState();
}

class _HomePageAdmState extends State<HomePageAdm> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const PrincipalAdm(),
    const CadastroCategoria(),
    const CadastroProduto(),
    const CarrinhoAdm(),
    const perfil(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: const Color.fromRGBO(255, 143, 0, 1),
        onTap: onTabTapped,
        index: _currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const CurvedNavigationBarItem(
            child: Icon(Icons.home),
            label: 'home',
          ),
          const CurvedNavigationBarItem(
            child: Icon(Icons.add_box_outlined),
            label: 'Add Categoria',
          ),
          const CurvedNavigationBarItem(
            child: Icon(Icons.add_box_outlined),
            label: 'Add Produto',
          ),
          const CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart_checkout_outlined),
            label: 'Carrinho',
          ),
          const CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
