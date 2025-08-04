import 'package:flutter/material.dart';

Widget buildEstante({double height = 20}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 92, 63, 51),
        border: Border.all(color: Colors.black, width: 2),
      ),
    ),
  );
}
