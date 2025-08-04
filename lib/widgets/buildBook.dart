import 'package:flutter/material.dart';

late Color primaryColor;
late Color secondaryColor;

Widget buildBook({required Color primaryColor, required Color secondaryColor}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: primaryColor,
      border: Border.all(color: Colors.black, width: 2),
    ),
    width: 20,
    height: 80,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 2),
          child: Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            width: double.infinity,
            height: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            width: double.infinity,
            height: 5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 48, bottom: 2),
          child: Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            width: double.infinity,
            height: 10,
          ),
        ),
      ],
    ),
  );
}
