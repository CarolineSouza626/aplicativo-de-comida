/* Classe para fazer o controle de cada registro recebido do firebase */
class Item {
  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.categoryId,
      this.checked = false});
  String id;
  String name;
  String description;
  String image;
  bool checked;
  String categoryId;
}
