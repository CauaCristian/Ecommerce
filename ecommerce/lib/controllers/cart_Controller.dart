
import '../models/cart_Model.dart';
class ControllerCart {
  CartModel cartModel = CartModel();
  List get listProductOfCart {
    return cartModel.listProductOfCart;
  }
  addProduct(String name, String description, String image, double value){
    cartModel.addProduct(name, description, image, value);
  }
  double sumCart(){
    return cartModel.sumCart();
  }
}