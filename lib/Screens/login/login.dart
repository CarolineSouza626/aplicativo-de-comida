import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marmita/widgets/auth_Check.dart';
import '../cadastro/cadastro_user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final _firebaseAuth = FirebaseAuth.instance;
  final email = TextEditingController();
  final senha = TextEditingController();
  bool _versenha = false;
  bool loading = false;

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
          key: formKey,
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
              controller: email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Informe o email corretamente!';
                }
                return null;
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
              controller: senha,
              keyboardType: TextInputType.text,
              obscureText: !_versenha,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Informe uma senha!';
                } else if (value.length < 6) {
                  return 'A senha deve conter pelo menos 6 digitos';
                }
                return null;
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
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
            Container(
              height: 40,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text(
                  'Recuperar Senha',
                  textAlign: TextAlign.right,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 40,
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
                        'Login',
                        style: TextStyle(
                          //  fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Icon(
                        Icons.login_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                  onPressed: () {
                    login();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 40,
              alignment: Alignment.center,
              child: TextButton(
                child: const Text(
                  'Registrar - se ',
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CadastroUser()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    try {
      // ignore: no_leading_underscores_for_local_identifiers
      UserCredential _userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email.text, password: senha.text);
      // ignore: unnecessary_null_comparison
      if (_userCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AuthCheck()));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario nao encontrado!'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sua senha esta errada!'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
