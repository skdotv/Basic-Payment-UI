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

Widget textWidget({String hintText, Color hintColor = Colors.grey}) =>
    TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        isDense: true,
        filled: true,
        fillColor: Colors.white,
        hintText: hintText ?? "",
        hintStyle: TextStyle(
          fontSize: 14,
          color: hintColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
