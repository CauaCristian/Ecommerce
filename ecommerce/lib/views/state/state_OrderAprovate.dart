import 'package:flutter/material.dart';
import 'state_Order.dart';

class StateOrderAprovate implements StateOrder {
  BuildContext context;

  StateOrderAprovate({required this.context});

  @override
  void gerarMensagem() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Pedido Aprovado"),
        content: const Text("Obrigado volte sempre"),
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
