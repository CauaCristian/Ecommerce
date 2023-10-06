import 'package:flutter/material.dart';
import 'state/state_Order.dart';
import 'state/state_OrderAprovate.dart';
import 'state/state_OrderRejected.dart';
import 'state/state_OrderPending.dart';

class Cart extends StatefulWidget {
  final List<dynamic> listProductOfCart;
  final void Function(double) remove;
  final double sumCart;
  StateOrder? stateOrder;

  Cart({
    required this.listProductOfCart,
    required this.remove,
    required this.sumCart,
    this.stateOrder,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    super.initState();
    widget.stateOrder = StateOrderPeding(
      context: context,
      value: widget.sumCart,
      setStateAp: () {
        setState(() {
          widget.stateOrder = StateOrderAprovate(context: context);
          widget.listProductOfCart.clear();
          Navigator.pop(context);
          Navigator.pop(context);
          widget.stateOrder?.gerarMensagem();
          widget.stateOrder?.gerarMensagem();
        });
      },
      setStateRep: () {
        setState(() {
          widget.stateOrder = StateOrderRejected(context: context);
          Navigator.pop(context);
          Navigator.pop(context);
          widget.stateOrder?.gerarMensagem();
          widget.stateOrder?.gerarMensagem();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String getState() {
      if (widget.stateOrder is StateOrderAprovate) {
        return "aprovado";
      }
      if (widget.stateOrder is StateOrderPeding) {
        return "Pendente";
      }
      if (widget.stateOrder is StateOrderRejected) {
        return "reprovado";
      }
      return "";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho de compras"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 685,
            child: ListView.builder(
              itemCount: widget.listProductOfCart.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(widget.listProductOfCart[index].image),
                    ),
                    title: Text(
                      "${widget.listProductOfCart[index].name} - \$${widget.listProductOfCart[index].value.toStringAsFixed(2)}",
                    ),
                    subtitle: Text(widget.listProductOfCart[index].description),
                    trailing: IconButton(
                      onPressed: () {
                        widget.remove(widget.listProductOfCart[index].id);
                        Navigator.pop(context, "Item removido");
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 8,
            child: SizedBox(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Valor: \$ ${widget.sumCart.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 24)),
                  Text(
                    getState(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (widget.stateOrder != null) {
                          widget.stateOrder!.gerarMensagem();
                        }
                      },
                      child: const Text(
                        "Finalizar",
                        style: TextStyle(
                            fontSize: 24, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
