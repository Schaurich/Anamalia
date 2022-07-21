import 'package:flutter/material.dart';

class CustomScaffoldMessenger {
  factory CustomScaffoldMessenger() => _singleton;

  CustomScaffoldMessenger._internal();

  static final CustomScaffoldMessenger _singleton = CustomScaffoldMessenger._internal();

  static final globalKey = GlobalKey<ScaffoldMessengerState>();
}
