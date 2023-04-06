import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:marmita/Screens/carrinho/carrinho.dart';
import 'package:marmita/Screens/inicial/lista_compra.dart';
import 'package:marmita/Screens/perfil/perfil.dart';

import '../busca/busca.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Principal(),
    //const Carrinho(),
    const Buscar(),
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
        onTap: onTabTapped,
        index: _currentIndex,
        backgroundColor: Colors.white,
        color: const Color.fromRGBO(255, 143, 0, 1),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const CurvedNavigationBarItem(
            child: Icon(Icons.search),
            label: 'Buscar',
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
