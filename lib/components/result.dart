import 'package:flutter/material.dart';

class result extends StatelessWidget {
  const result({
    Key? key,
    required this.hasil,
  }) : super(key: key);
  final double hasil;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Hasil",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            hasil.toStringAsFixed(1),
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}