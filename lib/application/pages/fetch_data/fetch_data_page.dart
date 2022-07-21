import 'package:dowing_app/application/pages/fetch_data/fetch_data_vm.dart';
import 'package:dowing_app/core/shared/widgets/widget_state.dart';
import 'package:flutter/material.dart';

class FetchDataPage extends WidgetState<FetchDataVM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Center(
          child: Image.asset(
            'assets/loader.gif',
            height: 250,
            width: 250,
          ),
        ),
      ),
    );
  }
}
