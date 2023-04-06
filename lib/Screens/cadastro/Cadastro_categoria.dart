import 'package:flutter/material.dart';
import 'package:marmita/commons/categoria/categoria.dart';

import '../../commons/categoria/categoriaService.dart';
import '../../commons/loading.dart';

class CadastroCategoria extends StatefulWidget {
  const CadastroCategoria({super.key});

  @override
  State<CadastroCategoria> createState() => _CadastroCategoriaState();
}

class _CadastroCategoriaState extends State<CadastroCategoria> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _isLoading = false;
  final Category _category = Category();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Loading(
        isLoading: _isLoading,
        child: Container(
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
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: false,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    labelText: 'Categoria',
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
                keyboardType: TextInputType.text,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                    labelText: 'Descrição',
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
                          'Cadastro',
                          style: TextStyle(
                            //  fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Icon(
                          Icons.verified_user_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        CategoryService categoryService = CategoryService();
                        categoryService.add(_category);
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content:
                                      Text("Dados gravados com sucesso!!!")));
                          _formKey.currentState!.reset();

                          // Navigator.of(context).pop();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Problemas ao gravar dados!!!"),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
