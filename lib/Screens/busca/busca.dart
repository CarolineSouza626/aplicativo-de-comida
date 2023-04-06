import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:marmita/commons/produto/product_service.dart';

class Buscar extends StatefulWidget {
  const Buscar({Key? key}) : super(key: key);

  @override
  State<Buscar> createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  late CollectionReference firestoreRef;
  FirebaseStorage storage = FirebaseStorage.instance;
  String nome = '';
  List<Map<String, dynamic>> data = [];
  addData() {
    for (var element in data) {
      FirebaseFirestore.instance.collection('produto').add(element);
    }
  }

  ProductService product = ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          top: 70,
        ),
        child: TextField(
          autofocus: true,
          keyboardType: TextInputType.text,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            labelText: 'Buscar',
            suffixIcon: const Icon(Icons.search_outlined),
          ),
          onChanged: (val) {
            setState(() {
              nome = val;
            });
          },
        ),
      ),
      StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('produto').snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      var data = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      if (nome.isEmpty) {
                        return ListTile(
                          title: Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['description'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Image(image: NetworkImage(data['image'])),
                        );
                      }
                      if (data['name']
                          .toString()
                          .toLowerCase()
                          .startsWith(nome.toLowerCase())) {
                        return ListTile(
                          title: Text(
                            data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['description'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Image(image: NetworkImage(data['image'])),
                        );
                      }
                      return Container();
                    }));
          })
    ]));
  }
}
