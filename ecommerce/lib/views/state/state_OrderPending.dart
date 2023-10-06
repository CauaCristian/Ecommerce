import 'package:flutter/material.dart';
import 'state_Order.dart';

class StateOrderPeding implements StateOrder {
  BuildContext context;
  double value;
  void Function() setStateAp;
  void Function() setStateRep;

  StateOrderPeding({
    required this.context,
    required this.value,
    required this.setStateAp,
    required this.setStateRep,
  });

  @override
  void gerarMensagem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Deseja aprovar o pagamento ?"),
        content: Text("valor de: \$ ${value.toStringAsFixed(2)}"),
        actions: [
          ElevatedButton(
            onPressed: () {
              setStateRep();
              Navigator.pop(context);
            },
            child: const Text("Não"),
          ),
          ElevatedButton(
            onPressed: () {
              setStateAp();
              Navigator.pop(context);
            },
            child: const Text("Sim"),
          ),
        ],
      ),
    );
  }
}
