import 'package:flutter/material.dart';

class BaseStructureWidget extends StatelessWidget {
  const BaseStructureWidget({
    required this.child,
    this.padding = const EdgeInsets.all(8),
    Key? key,
  }) : super(key: key);

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraint) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraint.maxHeight,
                    minWidth: constraint.maxWidth,
                  ),
                  child: Padding(padding: padding, child: child),
                ),
              )
            ],
          ),
        ),
      );
}
