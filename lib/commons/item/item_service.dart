import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../categoria/categoriaService.dart';
import '../produto/product.dart';
import 'item.dart';

class ItemService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
//criar lista e populá-la com dados dos produtos
  List<Item> itens = [];
  List<Product> allProducts = [];

  String _search = '';
  //utilizado pela pesquis da listagem de produtos
  String get search => _search;
  set search(String value) {
    _search = value;
  }

  ItemService() {
    // _loadAllProducts();
    // getItens();
  }

  List<Item> get itemList {
    return itens;
  }

  Future<List<Item>> getItens(String selectedItemCategory) async {
    debugPrint("valor do argumento $selectedItemCategory ");
    CategoryService _categoryService = CategoryService();
    String cat = await _categoryService.getCategoriesByID(selectedItemCategory);
    Query<Map<String, dynamic>> ref;
    if (cat.contains('Todas')) {
      ref = firestore.collection('products');
    } else {
      ref = firestore
          .collection('products')
          .where('categoryId', isEqualTo: selectedItemCategory);
    }
    var snapshot = await ref.get();
    if (snapshot.docs.map((p) => Product.fromDocument(p).name).isNotEmpty) {
      allProducts
          .addAll(snapshot.docs.map((p) => Product.fromDocument(p)).toList());
      // itens.add(Item(
      //     name: snapshot.docs
      //         .map((p) => Product.fromDocument(p).name)
      //         .toString()));
    } else {
      debugPrint("Não existe produtos registrados");
    }
    itens = [];
    for (var item in allProducts) {
      itens.add(Item(
          id: item.id!,
          name: item.name!,
          description: item.description!,
          categoryId: item.categoryId!,
          image: item.image!));
    }
    allProducts = [];
    return itens;
  }

  List<Item> getFilteredItens() {
    // final List<Item> filteredItens = [];
    firestore.collection('products').snapshots().listen((snapshot) {
      if (snapshot.docs.map((p) => Product.fromDocument(p).name).isNotEmpty) {
        itens.add(
          Item(
            id: snapshot.docs.map((p) => Product.fromDocument(p).id).toString(),
            name: snapshot.docs
                .map((p) => Product.fromDocument(p).name)
                .toString(),
            description: snapshot.docs
                .map((p) => Product.fromDocument(p).description)
                .toString(),
            image: snapshot.docs
                .map((p) => Product.fromDocument(p).image)
                .toString(),
            categoryId: snapshot.docs
                .map((p) => Product.fromDocument(p).categoryId)
                .toString(),
          ),
        );
        debugPrint("Itens filtrado ${itens[0].name}");
      }
    });
    return itens;
  }

  //busca todos os produtos
  _loadAllProducts() async {
    firestore.collection('products').snapshots().listen(
      (snapshot) {
        allProducts
            .addAll(snapshot.docs.map((p) => Product.fromDocument(p)).toList());
      },
    );
    for (var item in allProducts) {
      itens.add(
        Item(
          id: item.id!,
          name: item.name!,
          description: item.description!,
          image: item.image!,
          categoryId: item.categoryId!,
        ),
      );
    }
  }

  ///método para obtenção de lista de produtos
  // Stream<QuerySnapshot> getProducts() {
  //   CollectionReference productsRef = firestore.collection('products');
  //   return productsRef.snapshots();
  // }

}
