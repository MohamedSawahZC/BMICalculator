import 'package:bmicalculator/componenets/constants.dart';
import 'package:flutter/material.dart';

Widget iconBack (String data,IconData icon){


  return Column (
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        icon,
        size: 80.0,
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '$data',
        style: labelTextStyle,
      ),
    ],
  );
}