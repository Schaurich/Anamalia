// ignore_for_file: cascade_invocations

import 'package:dowing_app/application/pages/auth/login/login_vm.dart';
import 'package:dowing_app/core/shared/widgets/widget_state.dart';
import 'package:flutter/material.dart';

class LoginPage extends WidgetState<LoginVM> {
  LoginPage({this.comingFromChangePassword});

  final bool? comingFromChangePassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.amber,
    );
  }
}
