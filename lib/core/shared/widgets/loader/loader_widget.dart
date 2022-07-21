import 'package:dowing_app/core/shared/widgets/loader/loader_vm.dart';
import 'package:dowing_app/core/shared/widgets/widget_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoaderWidget extends WidgetState<LoaderVM> {
  LoaderWidget({required this.child});
  final Widget child;
  final _loaderBackgroundColor = Colors.grey.withOpacity(0.5);
  @override
  Widget build(BuildContext context) => MaterialApp(
        builder: (context, widget) {
          final data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  child,
                  Observer(
                    builder: (_) => vm.isShowLoader
                        ? Positioned(
                            bottom: 0,
                            top: 0,
                            left: 0,
                            right: 0,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                              child: Container(
                                color: _loaderBackgroundColor,
                                child: Center(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 250,
                                                width: 250,
                                                child: Image.asset(
                                                  'assets/loader.gif',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const Offstage(),
                  )
                ],
              ),
            ),
          );
        },
      );
}
