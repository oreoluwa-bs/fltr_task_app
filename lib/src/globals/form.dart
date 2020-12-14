import 'package:flutter/material.dart';

import 'globals.dart';

InputDecoration kTaskFormInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: primaryColor, width: 2.0),
    borderRadius: BorderRadius.circular(10.0),
  ),
  focusColor: primaryColor,
);
