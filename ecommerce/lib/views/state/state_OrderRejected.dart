import 'package:flutter/material.dart';
import 'state_Order.dart';

class StateOrderRejected implements StateOrder {
  BuildContext context;

  StateOrderRejected({required this.context});

  @override
  void gerarMensagem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Pedido Reprovado"),
        content: const Text("tente novamente"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("ok"),
          ),
        ],
      ),
    );
  }
}
