//classe de dados para envio e recebimento
//do Firebase
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  //variáveis de instância (guarda o estado do objeto)
  String? id;
  String? name;
  String? description;
  String? categoryId;
  num? price;
  String? unit;
  String? image;

  //método construtor
  Product(
      {this.id,
      this.name,
      this.description,
      this.categoryId,
      this.price,
      this.unit,
      this.image});

  //Método utilizado para armazenar dados do documento obtido do Firebase
  Product.fromDocument(DocumentSnapshot doc) {
    id = doc.get(id!);
    name = doc.get('name');
    categoryId = doc.get('categoryId');
    description = doc.get('description');
    price = doc.get('price') as num;
    unit = doc.get('unit') as String;
    image = doc.get('image');
  }

  //método utilizado para enviar dados ao Firebase (conversão de informações
  //para Json) <String, dynamic> no formato de coleção do tipo Map
  //compatível com Json
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'categoryId': categoryId,
      'description': description,
      'unit': unit,
      'price': price,
      'image': image
    };
  }
}
