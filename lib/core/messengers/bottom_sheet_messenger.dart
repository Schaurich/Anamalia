import 'package:flutter/material.dart';

class CustomBottomSheetMessenger {
  factory CustomBottomSheetMessenger() => _singleton;

  CustomBottomSheetMessenger._internal();

  static final CustomBottomSheetMessenger _singleton = CustomBottomSheetMessenger._internal();

  static final scaffoldKey = GlobalKey<ScaffoldState>();
}
