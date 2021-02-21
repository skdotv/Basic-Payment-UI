import 'package:flutter/material.dart';

Widget commonTextBox(
        {String text = "",
        double fontSize = 15,
        Color color = Colors.grey,
        FontWeight fontWeight = FontWeight.normal,
        TextDecoration textDecoration = TextDecoration.none}) =>
    Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
