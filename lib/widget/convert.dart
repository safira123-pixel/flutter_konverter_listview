import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  final Function konvertHandler;

  Convert({Key key, required this.konvertHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child : const Text ("convert Suhu"),
        style : ElevatedButton.styleFrom( primary: Colors.blue
      ),
              onPressed: konvertHandler,
      ),
    );
  }
}