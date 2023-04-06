import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marmita/Screens/cadastro/cadastro_user.dart';
import 'package:marmita/Screens/login/login.dart';
import 'package:marmita/widgets/auth_Check.dart';

// ignore: camel_case_types
class perfil extends StatefulWidget {
  const perfil({Key? key}) : super(key: key);

  @override
  State<perfil> createState() => _perfilState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

// ignore: camel_case_types
class _perfilState extends State<perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ListView(
          shrinkWrap: true,
          children: [
            const DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.food_bank_sharp,
                      size: 50,
                      color: Color.fromRGBO(255, 143, 0, 1),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: const Icon(Icons.login),
                    title: const Text('Login'),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        const login = Login();
                        return login;
                      }));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.app_registration),
                    title: const Text('Cadastro'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CadastroUser()));
                    },
                  ),
                  ListTile(
                      leading: const Icon(Icons.map_outlined),
                      title: const Text('Endereço'),
                      onTap: () {}),
                  ListTile(
                    leading: const Icon(Icons.more_horiz),
                    title: const Text('Sobre'),
                    onTap: () {},
                  ),
                  ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      title: const Text('Sair'),
                      onTap: () async {
                        await _auth.signOut().then((user) => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthCheck(),
                            )));
                      }),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
