import 'package:flutter/material.dart';
import 'package:marmita/Screens/login/login.dart';
import 'package:marmita/service/auth_service.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key});

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  Auth_Service serve = Auth_Service();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _versenha = false;
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
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              obscureText: false,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  labelText: 'Nome',
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
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  labelText: 'E-mail',
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
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              obscureText: false,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  labelText: 'Telefone',
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
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: _versenha,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                    icon: Icon(_versenha
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        _versenha = !_versenha;
                      });
                    },
                  ),
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
                    String nome = _nameController.text.trim();
                    String email = _emailController.text.trim();
                    String senha = _passwordController.text.trim();
                    String telefone = _phoneController.text.trim();
                    serve.cadastrar(email, senha, telefone, nome);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(
                  'Tenho uma Conta ',
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
