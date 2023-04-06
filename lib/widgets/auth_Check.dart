import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marmita/Screens/home/home_page.dart';

import '../Screens/home/home_page_adm.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  StreamSubscription? streamSubscription;
  @override
  void initState() {
    super.initState();
    streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        // ignore: unrelated_type_equality_checks
      } else if (user.email == 'adm@gmail.com') {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePageAdm()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  // ignore: non_constant_identifier_names
  Dispose() {
    streamSubscription!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
