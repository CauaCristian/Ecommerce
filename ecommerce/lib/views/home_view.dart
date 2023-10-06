import 'package:flutter/material.dart';
import 'cart_view.dart';
import '../controllers/menu_Controller.dart';
import '../controllers/cart_Controller.dart';
import 'state/state_OrderPending.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ControllerMenu _controllerMenu= ControllerMenu();
  ControllerCart _controllerCart = ControllerCart();

  void _remove(double id) {
    setState(() {
      _controllerCart.listProductOfCart.removeWhere((product) => product.id == id);
    });
  }
  double _sumCart(){
    return _controllerCart.sumCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("e-commerce"),
      ),
      body: ListView.builder(
        itemCount: _controllerMenu.menu.length,
        itemBuilder: (BuildContext context, int index) {
          final product = _controllerMenu.menu[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Image.asset(product.image),
              ),
              title: Text(
                "${product.name} - \$${product.value.toStringAsFixed(2)}"),
              subtitle: Text(product.description),
              trailing: IconButton(
                onPressed: () {
                  _controllerCart.addProduct(product.name,product.description,product.image,product.value);
                  setState(() {});
                },
                icon: const Icon(Icons.add),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Cart(
                listProductOfCart: _controllerCart.listProductOfCart,
                remove: _remove,
                sumCart: _sumCart(),
                stateOrder: StateOrderPeding(context: context, value: 0.0, setStateAp: (){}, setStateRep: (){}),
              ),
            ),
          );
          if (result == "Item removido") {
            setState(() {});
          }
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}