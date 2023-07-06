import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
    prefixIcon: const Icon(
      Icons.mail,
      color: Colors.brown,
    ),
    fillColor: Colors.white,
    filled: true,
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.brown.shade500, width: 2)));
