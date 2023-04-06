import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marmita/commons/produto/product_service.dart';

class editar extends StatefulWidget {
  String id;

  editar(this.id);

  @override
  State<editar> createState() => _editarState();
}

class _editarState extends State<editar> {
  final _descricaoController = TextEditingController();

  final _valorController = TextEditingController();

  ProductService product = ProductService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 60,
        ),
        color: Colors.white,
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.food_bank_sharp,
                    size: 50,
                    color: Color(0xFFFF8F00),
                  ),
                  Text(
                    "Marmitaria",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _valorController,
              keyboardType: TextInputType.number,
              obscureText: false,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  labelText: 'Preço do Produto',
                  labelStyle: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  )),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _descricaoController,
              keyboardType: TextInputType.text,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  labelText: 'descriçao',
                  labelStyle: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  )),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      0.2,
                      1
                    ],
                    colors: [
                      Color.fromARGB(179, 252, 43, 217),
                      Color.fromARGB(255, 255, 145, 0),
                    ]),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: SizedBox.expand(
                child: TextButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Atualizar',
                        style: TextStyle(
                          //  fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Icon(
                        Icons.update_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                  onPressed: () async {
                    String valor = _valorController.text;
                    String descricao = _descricaoController.text;

                    final lebre = FirebaseFirestore.instance
                        .collection('produto')
                        .doc(widget.id);

                    lebre.update({'description': descricao, 'price': valor});
                    print('${widget.id}');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
