import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Auth_Service extends ChangeNotifier {
  // ignore: prefer_final_fields
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  Auth_Service() {
    _authCheck();
  }
  


  _authCheck() {
    _auth.authStateChanges().listen((User? user) {
      usuario = (user == null) ? null : user;
      isLoading = false;
      notifyListeners();
    });
  }

  cadastrar(String email, String senha, String telefone, String nome) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      User? user = result.user;
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'nome': nome,
        'email': email,
        'telefone': telefone,
      });
    } on FirebaseException {
      print('erro ao cadastrar');
    }
  }
}
