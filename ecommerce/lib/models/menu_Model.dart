import 'product_Model.dart';
class MenuModel{
  final List<Product> _menu = [
    Product(
      name: "Hamburguer",
      description: "Hamburguer, frango, salada, bacon, ovo",
      image: "assets/images/hamburguer.png",
      value: 30,
    ),
    Product(
      name: "Cachorro Quente",
      description: "salsicha, batata-palha",
      image: "assets/images/cachorroquente.png",
      value: 15,
    ),
    Product(
      name: "Coca-Cola",
      description: "lata 350ml",
      image: "assets/images/cocacola.png",
      value: 7,
    )
  ];
  List get menu{
    return _menu;
  }
}