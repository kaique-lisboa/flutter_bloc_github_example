import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxShadowsStyles {
  static final soft = (length) => BoxShadow(
    color: Colors.black,
    offset: Offset(0, 6.0),
    spreadRadius: -9,
    blurRadius: length != null ? length : 16,
  );
}