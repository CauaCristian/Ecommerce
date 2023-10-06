import 'product_Model.dart';

class CartModel {
  final List<Product> _listProductOfCart = [];
  List get listProductOfCart {
    return _listProductOfCart;
  }

  addProduct(String name, String description, String image, double value) {
    _listProductOfCart.add(Product(
        name: name, description: description, image: image, value: value));
  }

  double sumCart() {
    double sum = 0.0;
    for (int i = 0; i < listProductOfCart.length; i++) {
      sum += listProductOfCart[i].value;
    }
    if (sum != 0.0) {
      return sum = sum;
    }
    return 0.0;
  }
}
