import 'package:flutter/material.dart';

Widget buildWindow() {
  return Container(
    height: 250,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: const Color.fromARGB(255, 89, 134, 211),
      border: Border.all(color: Colors.black, width: 2),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 250,
          height: 20,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 78, 55, 45),
            border: Border.symmetric(
              horizontal: BorderSide(color: Colors.black, width: 2),
            ),
          ),
        ),
        Container(
          width: 20,
          height: 250,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 78, 55, 45),
            border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 2),
            ),
          ),
          child: Center(
            child: Container(
              width: 2,
              height: 250,
              decoration: BoxDecoration(color: Colors.black),
            ),
          ),
        ),
      ],
    ),
  );
}
