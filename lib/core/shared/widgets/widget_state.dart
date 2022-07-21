import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class WidgetState<TVm extends Object> extends StatelessWidget {
  final TVm vm = GetIt.instance.get<TVm>();
}
